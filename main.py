from django.core.management.utils import get_random_secret_key


def generate_secret_key() -> str:
    """Django の SECRET_KEY を生成して返す。
    """
    return get_random_secret_key()

def main():
    print("Hello from django-rest-framework-template!")
    # スクリプトとして直接実行したときにシークレットキーを表示する
    secret = generate_secret_key()
    print(secret)


if __name__ == "__main__":
    main()
