Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772843;
	b=ZEG+oANcKGQEh/4FXVpNuh7Q5eflLmJVGDSFTY8L+XFLIl+N4jnm6hIpu7OaGGrblA5f
	 o/A8/ecw3BFXjakhm4+2/G8La+QJYr8fOC+rHgRkpG/VO2K/s08aDxmDpItcZLyYHOTpD
	 YpE1yK2Xp1BGjCQ3yFtxVC7bBnWM0Zn35ME6u/BH3RHCiRRox13+zhlWgchE2tymcvijz
	 QItGW/FWDEDjT6PdJVxJBvQNl+fe15HBjvPkmqh+FagqGM25EtqEESFACjRjFaCcHS1Ma
	 GfuS1qWBK29+g0mVaAw9K77QCsAnW0KL0xjerAGtnZuwCHveHBcyskCMC5OjN7PoW1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
	b=dJHsMJTHFggW3GD/H66ykiioXWu1+m+BkJ0AU/UO1UCJBQIMrrQWTBjsr37FkjxB2DUo
	 Fohp9SqHAoZbpEqiXVQpQ+qUJMjN6YliMhfQ/aKweK4ubxhxTurO5BGmH0w5MlXWY6P2R
	 zKfTyxkbOtyKDtobt7BZOMZj4FmvxSSVa79zMrHWvm/2TIH6Z3D+pYsSBrZjDmRFWjhIn
	 AAD7SE1UM/6c29wgERnwcBZ/xo0NBp73cC/bgB9G2yQPPF4uUHnIwCT9qp7yIVUY/0jy8
	 r69ocenerW5ZLP3ppkKm2jIhwahctzfADZBv7nozaaxJvhhwV5xD+B4SMlM+5/n802g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=xLLkkSHM;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796F606A334
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3796F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=xLLkkSHM
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so12275788c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772842; x=1796377642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
        b=xLLkkSHMIjsxo3tmJs2E53upygYq78g9IH1QETQPWh2bjMSQM1MOp37S4UzbNnuDbM
         DQu02ZiAACzWIY6NCWo9keIZiH46RWMUcuQossac6Fc/jrBCNg1dARONlmvANKAK/ZsQ
         nBshyuLatavYVtEn5THROfQOguVnS0MpiqU/LnXNkqNqFn7kVf/HcSohlaCwTh1qgp56
         iWwWE4OeHL9Rqq0PPSlnXLPCKI1Mtj5ch29gGhQ/chzLdsa4ot0IldIl0KvPKyYGVej0
         cSISEcsM0yKFqNA1ibnKNQbpW1vd9+gaW58pPrvRC7RQoSdi5N8dGhGeSdPNcAz2QnGF
         mmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772842; x=1796377642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
        b=fHLFQWVlyOKDcQcQGEFjAlx1qzNNio2FZPQmm0WS6nc8wAAGDY3ryTP6hnpw9z+ZHm
         9oTKKKp1LVZong1zufT7b4++fw0TnkPLtKRIsLU683sA6vL6Z9kdA8GQ2ZeCUxj9VUUj
         YTXwgIjkiURRlYNn6l3JT/A1zwRINwUA38bI1ejfy/nlVu47MZ+aCocOFDIVkdIvEeOF
         QRTEQxnmjscLp6vLR3muRzd2sPrjKSNQ60PS8etzEa4BJXrouZ1DhCRkDyhEZZN20RZV
         pMMG0hdHSu4a6kd9+lnwbQBFLgmypzCQmMxlLPzEBj0itNnSgChn9xYs/rHTQknRohvE
         /kSQ==
X-Forwarded-Encrypted: i=1; AL+hErEaZtGbZuluVP84JwT5MCmjRjB3SfVcfieHfOBrFufEZqPK6M6o7TNwKhyeuO7YRkGPO23hoNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IuPfvzD5hawvbZC2dCnvhsLVO+uUFFZIJwn0PsSi8hnzShiSH
	XTdkr3ov4k4HS55AUv5+HtCa14pCWY4WnKP2ELCGSQTdK8nvMHg8dfShSiOtJoE5jps=
X-Gm-Gg: AZFdTZdTpT6o4724Sg2FTZEsNCKi7bo6AWyUIvE0gmSIiDP5bl7FPKYmG+j1Eb8REkG
	B6IAr3cyeYv8WIL64PqX81T+n0kAcQr1w1wBpPi8Q8GpdqwTmABSOvjOuKwJG2ft/G16TKMkk7/
	zwZXUO7WkJQsoZQED2i0xUc+V5XcsSwbHTb/FTzs+Ww9p2IAZh9nF0uG32He+n/JWZDEODWIQKJ
	e19c9kDTqIgkfFWYZ/140P5VvxlgeDo+ksLTBpAUld16HlqIpWk9EOR9kMBA7x6qKSX9YFuQZ0a
	j3witLNPJDjtjtUpbbZlHNYNJmn5KQa2iRoOrbk7alicGDydukswGqYrRvGw0rhAgalKSPbjsxX
	PORUszjG5wpdPoY8zhHVYEJeJY7Q35tZyo1FEecXDa9PPKTFzIVyohkw0/VKattggdCRd7xMrhL
	YvL/jLRlPECpp0hP97dYjqZKSgqdSz67TwCFQIIt5YYe5cjYbOVk41eTrhfby353EIAd4g1omHM
	36mBnZR6fjweO9nvpcwsTrBv+EdeH9vdk/dbs87fS5I9DuPnV3dBfkJt/LF0Y5m00ogBSx7Ec/T
	gnaeNUZT0Y/mkfI+ABJpFf4Yvfuk1f5zrGDi3E3qF0JDhPRx2nR5HQcQNljtWK8pJyq3mc3RUV5
	NEipDhpyVwlQoWZQUWBraKwPLF7ErHguHGH5N1RBcR0hRWpXA
X-Received: by 2002:a05:701b:418c:20b0:1b5:39a3:75e5 with SMTP id a92af1059eb24-1b556901fccmr24321772c88.33.1795772842312;
        Fri, 27 Nov 2026 01:47:22 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:21 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 10/12] MAINTAINERS: amt: cover the amt headers and selftests
Date: Fri, 27 Nov 2026 09:47:01 +0000
Message-ID: <20261127094703.3025517-11-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05b2d9e36..067271943 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1506,6 +1506,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
