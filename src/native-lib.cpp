#include <jni.h>
#include <android/log.h>

#define LOGI(tag, ...) __android_log_print(ANDROID_LOG_INFO, tag, __VA_ARGS__)

void* startModMenuThread(JavaVM* vm) {
    JNIEnv* env;
    
    if (vm->AttachCurrentThread((void*)&env, null) != JNI_OK) {
        return JNI_ERR;
    }
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env;
    
    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    LOGI("LOAD::", "Sucesso no carregamento");
    return JNI_VERSION_1_6;
}
