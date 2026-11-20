Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156227;
	b=jtMfds9SmHPq7zJUR908yJRTGj//2o4nCI9LtqBlSqvZ+M5lQ5a7R2mw944ERkz2Ra2P
	 KuvlDqV2qnSXvVlXHljStTwkX3MUXI9SS6Em4QoWP6Ubw4lKx4JxfhRTVAC9KjPTgX1sQ
	 s2fZ4WRFIZl1b0jIyPO5y2WD6Pbk4e6l0Sgt+JvkaY48uQPV57eix4e9qwNAq5bvA/nYE
	 /I0rLZwcawP6ReRj/Fg7B4d/GkSkCo6ecbGRZ+Awosl98FcRw7pi8hErCk6s4fs9YKQxU
	 8Y/ZqhFyIu5ndWx2JAgBHZ4n2osD+K3wgEob+rLtrHe539VmZHAC8UiLHERU1MUz80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
	b=PKLFSZqeQWqvmAsK+sliqv74ZVmgosm85tUBllR6FGeNQQAdb7erbeWAnEOnOItiw10N
	 6qclfeBUOM89263RY5e2XJfOeuBhdL4JH8z+CvX4AUNBADT8LSrxigqGJIrCIdMN/9+ii
	 A6jSyMKP1I3ZeMI5k2CVe8F7w1PqDKth+0Y3Nl4sbOVoGku/xCynfT1kl8RB1epUn1ZjE
	 a8dDL2CHkOH4JOQ1PxCLsfu2mVyGxSzOChivq7ioUe9uYZyEsXhaInZX/BxOF98hhT5Xr
	 l9f30udTMCV96NSpiEZV4n9wvT5DCqUgeAoZh1xzKst/D4CmmU0wt5qaXwVKAURkusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrKwf29R;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC0A606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrKwf29R
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so23204f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156225; x=1795761025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
        b=rrKwf29RxJaLqeRRwX0Hr8VMInzojJKS4lEs/16ybfr09oIYUUK6GVEHgx8Gek+Io4
         yL2RIjKhBZ+Z4ViGC34h/PjIMMdCZE6KaWf8lRpbnjeWJNJsaJCdwKmI+Xa5aS+IUN7D
         cL3fUcLe/z5vWV7qLDRT+qGF5DyNUQEMAYn7acLo/KJGrGsnKIR1QaMxIDwW/kLG7mtm
         SbJc9YVVlx4Tf39gy5a4PLW+pNcruFddWwZNkEFVe1GwZA+zW7TRDwcmYuwTnzViOOhd
         znp0YNI8AirzHUDgnJJbBCHQJG09WECBSU46BjuSmQMA2eWO5pEfFh8UKh9fHuAqQz+C
         ZcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156225; x=1795761025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
        b=WelHvIofhQ9FdLJzIxsiqmsN0zHisBvFsWQwsBuA4qW+cBJWD1JYzusK4FyIzXi8Fi
         9eip4uZqFLn+CTwkeUKrRVJ/DFBqx8RblzX7Z6VLTWxINT+2VUzWSAl0vmg6GPOhIssj
         2AxXlKZfcU1lOET1Xddzp4syDLEpvYIa6SsZURUAhQYQ9rnySnYX7JV5p7BSpLZcZvde
         ZXa5FmBEdda/JdqNLfqThUz3JMT4C/tSk2RGjwhh9P+6sWf2nK4vs9yQn2HzJRe4NSTj
         pWSS9kTr6pKAKkpPIeHZQAh+UhLKJjXHShiExhl0P7Ne5qncN2UNgpganSlyZaeNxcHB
         lvTw==
X-Gm-Message-State: APuU4Z8HJiiptPTVwEAlzs7KxADwzZigf4F50kMzlM6xQLmuUZWEj0Cz
	7mfelxsj/ElKslDLSVqCc7Jb2UouvjhzZ1amy2/I/XkmyxdYLoNren+c1cIXLkyqVwY=
X-Gm-Gg: AYBFou34oFQn8ybbs5odTKmUh5hSXkOGxVei9sxjAI6GwmrXkj4f/gAH16ykUKoxl0s
	HBDyhRXzbf5acqBqFe+0p+mcT/H/0HMyn1SsTRJvlWqajmzOzZKtig049leP6gMy/kRntNmZ3iI
	kwD505DffJaCcRvDfKr38IYEeKEJOaBDf4Qc/hwlN/D30aQnW/wr17VCWcc7QPumdSvHmEsPVUQ
	Gh+YHYNd5z5mUOwxu7sHq0meLDYUG1V05ELOyiblH4qgE0z68ELrARU14MsYeZNokjMoT8gSf+D
	ERqj67dDzjpRSJyvBk6TXkLBJtob0y+WbAqP8i6nDZInXvi0m5KxHrwDNtxJljCK2djSbFnOvnw
	O6BDfGrmIvSRlQbw97WhatipaE9t/88DybV8e3K3u4/+EJcp00Y5dXDDnJsG3cyWtISPmuuCweT
	VFUHCHkL+UvEdmORs3SFyLrLBzK/LzB1FjfDYARZI1+anyHXBLsaEZM+qA9fz1wNT3xPp+teXnB
	i+5I5ar1XWPFWEILkMqfYoKxJgWhhrOaOyD8ID2RLtqqMqJz96gzTye7Twam8Nlcp21vViLjCCP
	pXUro26XWoXFzTLyRPJPMgdHHSODx2nI8IwuUl9uhX+yRPVEyNWMexvhLEe91byZcZkmPg==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr30363775e9.1.1795156225028;
        Thu, 19 Nov 2026 22:30:25 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm77798865e9.9.2026.11.19.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:30:24 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Fri, 20 Nov 2026 07:30:11 +0100
Message-ID: <20261120063011.21557-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The connect() failure branch reports "bind fd2", copy-pasted from the
bind() block above. Name the failing call.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
index 4be418aefd9f7..4441e9c62fde5 100644
--- a/tools/testing/selftests/net/sk_connect_zero_addr.c
+++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
@@ -46,7 +46,7 @@ int main(void)
 	}
 e
 	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
-		error(1, errno, "bind fd2");
+		error(1, errno, "connect fd2");
 		goto out_err2;
 	}
 
-- 
2.43.0

