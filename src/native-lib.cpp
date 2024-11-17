#include <jni.h>
#include <android/log.h>
#include <stdio.h>

#define LOGI(tag, ...) __android_log_print(ANDROID_LOG_INFO, tag, __VA_ARGS__)
#define LOGE(tag, ...) __android_log_print(ANDROID_LOG_ERROR, tag, __VA_ARGS__)

void* startModMenuThread(JavaVM* vm) {
    JNIEnv* env;
    LOGE("thread::", "Thread foi iniciada com sucesso");
    
    if (vm->AttachCurrentThread(&env, nullptr) != JNI_OK) {
        LOGE("thread::", "Falha ao anexar a thread");
        return nullptr;
    }

    LOGE("thread::", "Thread foi anexada");
    jclass clazz = env->FindClass("java/lang/Class");
    char str[255] = {0};
    sprintf(str, "FindClass: %p", str);
    LOGI("thread::", str);
    return nullptr;
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env;
    
    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    LOGI("load::", "Sucesso no carregamento");
    return JNI_VERSION_1_6;
}
