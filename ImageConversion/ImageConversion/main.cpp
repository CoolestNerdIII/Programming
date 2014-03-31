//
//  main.cpp
//  ImageConversion
//
//  Created by Paul Wilson on 3/28/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#include <iostream>
#include <unistd.h>
#include <string.h>
#include "/opt/local/include/tesseract/baseapi.h"
#include "/opt/local/include/leptonica/allheaders.h"

using namespace std;

//int main(int argc, char** argv)
int main()
{
    
    char *outText;
    
    tesseract::TessBaseAPI *api = new tesseract::TessBaseAPI();
    // Initialize tesseract-ocr with English, without specifying tessdata path
    if (api->Init(NULL, "eng")) {
        fprintf(stderr, "Could not initialize tesseract.\n");
        exit(1);
    }
    
    // Open input image with leptonica library
   // Pix *image = pixRead("/usr/src/tesseract-3.02/phototest.tif");
     Pix *image = pixRead("/Documents/Programming/ImageConversion/ImageConversion/image_sample2.jpg");
    api->SetImage(image);
    // Get OCR result
    outText = api -> GetUTF8Text();
    printf("OCR output:\n%s", outText);
    
    // Destroy used object and release memory
    api->End();
    delete [] outText;
    pixDestroy(&image);
    
    return 0;
}
