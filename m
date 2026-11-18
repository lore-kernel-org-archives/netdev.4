Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997201;
	b=5Mc7GPJchNQXbZHVl3Y/j0ksHnGDoG6+EgKrSK6dyW++98vcpb3ZexE9fWZ1KZzo40ff
	 WVqtFGCe7F9UmIOHy35WMzyuy00+619CyMSSiUCnnFh7NkUfcQVDWao74d8nuDNysaK8Z
	 jEEIBDyYhedU2pDe1IvO7mHTlMaDR7UCAYJcrIJTVUk0tPHL5RH0WfFYgO2M2CBGHs2bi
	 XRO4svthYqxEYIeIDYIdJzCkAMcGi/t+eabJ9YXq1Vh7G8YtqoIarS7rOmlajtvN9NRt5
	 wv/wzLvCwkI6ZiC9RzrdkUAVxCjhHYyxa5yGicTwAoW5ZNm8Ozg1KQiwewSNb8LIxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PSOjBgBm8MEjVeDHiZJ2TYhPPf+RsH0/cDY1a5KM/5A=;
	b=GWisYvMh7mo7SM2LDQ6eghh7A5FsMWJdyx9auwEP5/m3rZjPSb4vOLGIT1/Y9txTRxpf
	 SOnCNhvogbmtUz2jM3EnHoBI6qGFQ+dV02UAyKt05TG4eAL+nMSH1H0RTTVhgQ9g8z5rz
	 +0y49pMF3CkkoANZ0Xl42PVwspGPwiUv95UA+ZQmfCnbMA84QJSzSfnZGfQgAipQkb8wD
	 VkquXLOqDDdwTt73SCz+IiBV+UUbmF/tKHN4TSa7wcb1XnLWZoQdWwngIrLlyrMbZ3M34
	 3zdcNe4MHJqPsqufmSU7tL/VGjhSB4KhLOIIBpGA/5/Bl/3QoDIjLanfRC6mEAAT0CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iay5SgSp;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253D606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2253D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iay5SgSp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so5938205e9.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997199; x=1795601999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PSOjBgBm8MEjVeDHiZJ2TYhPPf+RsH0/cDY1a5KM/5A=;
        b=Iay5SgSpjL0rhXtaV+oUCmJ3TXpqB2e+vbTAwmnReRsQ3sWbm4c9/R5ywQEg9G/+cW
         frtUb116fFrI7PAJOfZGfkiJhVu19vB/+WGcYA3UV7qhUK0dbfeBZkizuh9kVvJl71Uu
         HH0D0ywv7q2POlWSFbs8ZLjjvdGw9+febpVt+bCefZzrtwfAbZUR+hx+G03ih3oscT2P
         7sMqbhTgxqpL3EoOlI+Ega44y632xOWHg5a0PI6UxtfzCt7HD6A9G+Byoe/5xrGCu1Ac
         5/ix3eOiS79skb7AiTtfxYzGydOnE63QpOCw7ZEh/npcm7hm+CM9rDzass9D0e+5ZllR
         LgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997199; x=1795601999;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSOjBgBm8MEjVeDHiZJ2TYhPPf+RsH0/cDY1a5KM/5A=;
        b=iFTjeLgriWWrMppyuY42vMoGRM318x9keaZzX3PRe8P/nzEWnGUfEwlNxLwRT52LRh
         GKUIMEJauht65ntAYeoLDoPrTp2w0rX3RAY0YVE+HQ85Yy7XefKcXN3agSh5IjO/BNEi
         MMRCKztFKGhj+bGexzKxuV208npKCfwzfGmTaHzc1MFHy30JHH/Ik05Sr9/BZQEoctfA
         AbkvpFejuWu8SmcG2LeFv3S0n25YgOpiH25Pi3faZ9gj/3lQxlwHGLkPBu5BLLk9zGlL
         ICXXn5g8oz9WN4hDOBGLsM358QaEb5aqR3UGzZ/2asNQiiwBKhxNPN89vJX1iAUBi5wA
         sZYg==
X-Forwarded-Encrypted: i=1; AL+hErHshBO1TTAMk+v2rA0RJ0jjiwLycDZzno2K3hkg3qsyrVdO01L0JDgp7Dt4zm6nX+JFQr//tGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rwybllfiYSXwLHVp4xK5xIH8B9bAjs1vv3pxClm9yjRPuwJbj
	IOIdBw0iN6lKZRJGAMlf6RitFI1QN2qRKSTor7GRp3RerLVF2vrgEu7yRVcxBLDa
X-Gm-Gg: AYBFou1piW/Kj/1QrBMwKv3bafFSmA1f2nRPAuel4zMuTB3lydZa72pzBNOew2Gx9UW
	KrQpsodQRJ3S2G2D8lsgqM8Dgxu2sx2E8F4SMeRpRzbYFAHmmZrgvSJcuzZ0AtFwiK35fTq8cq3
	YBAHcoD57S3dClvBNxAIQavQwPm8DHp90J+RT02vHDluZHzAvbdkDMnhkceYNwXfim46KDOUqVh
	zt5c4VYU6EZD2Ympyo54b+x7abFAl1smhOHZNHqm6yJZKEWZHeD2VxdvboDfEce7EhSDiNbjCil
	MaEvER/Ea9VZUNb5QE4UjBp3oLEYTUDq+PANezYdYUF5fe2IfdgCUhR9VBQ785926NuMtgX4Vnv
	KpUB0uHWK8wmUIkmZ2WsYv1NWhisvGZ8IYia4HPCViSqr36HEyubrkNwtk5LqtDceAF1wNrqYbG
	k+2VKQQSTCTJurQmD1JaWCx2HAPMlGkozFBYzcYGn3JSAXVFX4oJSeCqxpQL+odSTLprdLrOuEW
	Pa3bf6GiWRFgDD7S09PGUKSVWPXfOuMjtOFEru9qi0hvvfu5Zv0uabdR1HE3MvOJZOmgn7S1FnG
	DaO7Thz1/ODlRhKjH+Qu0FVmTplwb/EaH5yQmq2nm6uCgIZ/fNYLj3GrDxwNHGs++g==
X-Received: by 2002:a05:600c:4e45:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb7da127ccmr35383495e9.12.1794997199431;
        Wed, 18 Nov 2026 02:19:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c7b7sm44275345e9.5.2026.11.18.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:19:59 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel
 <idosch@nvidia.com>, bridge@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH] net: bridge: avoid redundant strlen() in
 show_backup_port()
Message-ID: <20261118101957.29ffcfd6@pumpkin>
In-Reply-To: <20261117165106.635733-1-dmantipov@yandex.ru>
References: <20261117165106.635733-1-dmantipov@yandex.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 19:51:06 +0300
Dmitry Antipov <dmantipov@yandex.ru> wrote:

> In store_backup_port(), prefer strchrnul() over strchr() to
> avoid redundant call to strlen().

For most architectures I think the compiler optimises that strlen()
to a check of buf[0].
So you don't get the function call at all.

David

> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  net/bridge/br_sysfs_if.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/bridge/br_sysfs_if.c b/net/bridge/br_sysfs_if.c
> index 621d62a063d9..03205b3f465f 100644
> --- a/net/bridge/br_sysfs_if.c
> +++ b/net/bridge/br_sysfs_if.c
> @@ -231,12 +231,12 @@ static ssize_t show_backup_port(struct net_bridge_port *p, char *buf)
>  static int store_backup_port(struct net_bridge_port *p, char *buf)
>  {
>  	struct net_device *backup_dev = NULL;
> -	char *nl = strchr(buf, '\n');
> +	char *nl = strchrnul(buf, '\n');
>  
> -	if (nl)
> +	if (*nl != '\0')
>  		*nl = '\0';
>  
> -	if (strlen(buf) > 0) {
> +	if (nl - buf > 0) {
>  		backup_dev = __dev_get_by_name(dev_net(p->dev), buf);
>  		if (!backup_dev)
>  			return -ENOENT;

