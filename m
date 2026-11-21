Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289529;
	b=BFjNMgrrQ0av2DvdpkcGAf9xFQnD972xOtxETrz0tzpMYw4hprxRdF7nVX1vInAiybEh
	 bbQ/XebdEuTdS27BlodQe0xpAJlNYYoCvDCSAmYg2CseVwcjv1VJfAmtjKa8cQJo38eBl
	 Ommz3t5DxFRGPTLwXgy6XWotS+M/UAz/VPw/Og6xzyDNbACFgHxiCalyNK0fE2FRCgpLE
	 8pOsTfstPzLRSyuR5gRFG/0pCuZd5i7hWDTrx0csfmvKXWbXq50RiHFn0FFy4VdSt0HHf
	 O0GE5AlZjgMeHlyXF8UCAAvHe/Tm63YoOEEBZ1KT1GYW+h3Si8zMBxFbHY9KOo5HUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VE4zAAxcygsvV5ZcsBxmmkhqvwMRdkRmIU2rT504NLg=;
	b=lreasmELGxRT/CCGnrnFU32HoJ8nRX6i0rYwSOgbHtLuomc+6xno92h5cEIs4Gq/32Ks
	 gvzB3vHfjj5lK/Yg5MNMHRLjMLni+JPUjzbAJhLRc8s791asBI+Wtpt3UGJn9jVP2jopm
	 d9lCZnjoh8OlW6wkjxwt3dbSyqKphrtixXoykYJpU8krw3h1Ep/thCYyNYk3DpbfrnG/e
	 kPejmoM0cr+6mSWhshy0r8UoLigayBoukn6zUSKzql1DNz1sx3drS14d/GEzZvBZAvwf1
	 ++HP9LcGW5ybXVPF3krx4yC/amP9QvhmHbz9Dr8gaa34Be8+KJbCUDlJT3MdKBzSpWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRe5Yaq;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD4606A33C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBD4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRe5Yaq
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f02ee04378so16226525ad.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289528; x=1795894328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VE4zAAxcygsvV5ZcsBxmmkhqvwMRdkRmIU2rT504NLg=;
        b=jHRe5YaqOekqoanDCL2SqWu+a0WnRr+HP/6F5Xp/9YDfMohErQGbCjzj1yVPjIfq8v
         N8v1HFclRLzyZ3jmWqlq8ipqm0qgH0hueJ+ZTMgeRLOsqrM/VmS2ibNaihovCF3yx6Kf
         rhfX42Y3ADLvbkuvgAeNfrF5PXvv86jqJyyApYPubLNbDZYk99Q003BdQZMLGr8cITD7
         Re2W4mVpE7fvHrvMrCCrZKcgB8r2HpYkhZF38cPptw6EBtARGGAeFkV4LTRmDDaXwd+e
         509ENlVvFgIVhHqPYvmL/TU8xg6aFmeZQR/KD7XZtIHlyw2PNfiOgdKAnEQqFBT9WscW
         1WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289528; x=1795894328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VE4zAAxcygsvV5ZcsBxmmkhqvwMRdkRmIU2rT504NLg=;
        b=WLoP9gWm5nIbNWU1s8ND0CqQpVu/lmxO11F7Nxa/BfhovVqnVGer9++uyhhoariBrY
         YReIYol/TU+IPtUQ6zI0AV1Joo77Ey7ZyQY9udfT/nNYJFnFz7JTBjfjIyj3WHPQaAfE
         CLvGqJoPRHdt+Z4AmA5Ph09yPc8ymPBSDHRTm+nxTLkPzOkuF955KFnFnXhvJ867QLmC
         RT6BkOj12j+13gy9Y6yMu95EQU2EE2JMp5uUDf2Ejb2rt6/EUvrVE7wOrfgjNvFjtd99
         pu+OhqJHkOCkbVg3KC3sWhBJJMbrHlSrNClv0cSiQlUWXawIU8OyI6qqL7m4IMZc3WcH
         8hxw==
X-Forwarded-Encrypted: i=1; AL+hErHTlQWOTBNiN/PPwCZEEL/BSPH5Khwl6w+Y4JxL0NnlfNBhbCGmh8uiyOW8Jc+mG4tCEwPh1DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RVWKenIJvzrqpj1NoSNTfAU7OJ0RH2VKJbJbfkPFejdTeYxZD
	HnZBMY0JzgG+y763WUM1DIWOmAQj8j/JD7bbb5Gm0qQZ6tMvhQB/9fzw
X-Gm-Gg: AZFdTZc1d7Uhv0Ej0TXiOKAJwMB1BiUwkUE0jvksf+t9MhtL1sUi5eHFRBSP2jKwvoa
	z7H/z2afxPevxbOv/M+ExWJ4MBn/qGR52caVyT7GtD272RYmOu5w1AN6AYaHdfI0jCkqJI+tuhV
	Q6sgk2tftYCcY1Rdam+xdU22Cs3+dRJSAo4tQ+f4nnFX4kN7U4s8qooHzfsfa1lmyy/KsqEv0Aj
	TN+yaywDUW2TIBuTtnniEsnFk62L0frmSSCYaD2tVVfvq4hdCBVOL8HFRWH9h0saxxU7swbwoqG
	qM/8YLt1thOgI/aJxl5zTlY3T6taceclg2Qb/SHDfbF2GdzajYNXA2C4ayej2o/oJBRpco4YciM
	egT35CaNjNU5OcwCY413e+9qUydhkY7/sqzeUgPrL8l/Zq0GafaCqe7ONsyeej49A0WqnqBafPI
	W4503rLd+bjXZBaOXEgaXP3zN9RsJOZvy4qg3F4kYWSwaNSPfB7NSJ7jRqHbzKNUjZliCnERXQJ
	dP2i+v9SfaZuJubH0wi9Mk0VNz7KJGqgjFG8NGdrbvgFC1l+j4A6I82k4moimkzuN9c+1x8Ne26
	zL4uVWwYQ+6eD9ATHf5WraNXRIXVPErPaQutYeJMjdRpVUbRm/alILp/yn9UAyrokk7aVKH/WJe
	kRNU8/WtI2rB7
X-Received: by 2002:a17:902:e847:b0:2ef:e32d:f476 with SMTP id d9443c01a7336-2f03f1cf4cdmr74856185ad.10.1795289527674;
        Sat, 21 Nov 2026 11:32:07 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm28591205ad.59.2026.11.21.11.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:32:06 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/1] netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()
Date: Sun, 22 Nov 2026 04:32:01 +0900
Message-ID: <179528809256.2009509.5007624677973207521@gmail.com>
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

nsim_start_peer_tx_queue() can wake a TX queue past the end of the
peer's TX queue array after the device is relinked to a peer with fewer
TX queues; KASAN reports a slab-out-of-bounds read in nsim_poll(). The
patch skips the wake-up in that case.

v2: send the patch inline instead of as an attachment (Jakub).
v1: https://lore.kernel.org/netdev/179505710275.3511681.13434978152402269948@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the KASAN report.

Kyuwon Cho (1):
  netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()

 drivers/net/netdevsim/netdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.43.0

