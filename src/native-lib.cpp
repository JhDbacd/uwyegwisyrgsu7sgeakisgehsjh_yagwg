#include <jni.h>
#include <android/log.h>
#include <pthread.h>

#define LOGI(tag, ...) __android_log_print(ANDROID_LOG_INFO, tag, __VA_ARGS__)
#define LOGE(tag, ...) __android_log_print(ANDROID_LOG_ERROR, tag, __VA_ARGS__)

JavaVM *g_jvm;

void* startModMenuThread(void* arg) {
    JNIEnv* env;
    LOGI("thread::", "Thread foi iniciada com sucesso");
    
    if (g_jvm->AttachCurrentThread(&env, nullptr) != JNI_OK) {
        LOGE("thread::", "Falha ao anexar a thread");
        return nullptr;
    }

    LOGI("thread::", "Thread foi anexada");
    jclass clazz = env->FindClass("java/lang/Class");
    LOGI("thread::", "FindClass: %p", clazz);
    return nullptr;
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv* env;
    
    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    LOGI("load::", "Sucesso no carregamento");
    env->GetJavaVM(&g_jvm);
    pthread_t thread;
    pthread_create(&thread, nullptr, startModMenuThread, nullptr);
    return JNI_VERSION_1_6;
}
