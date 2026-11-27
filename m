Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786845;
	b=k0HUTGoizap2QmGiM6DciEck2M/7mRY/FVvUx2A30j3dISqJKWoIo2uK8XofgQn3EmBw
	 o5ml4bbmXqCW+uIHEzEsFMkfm/LxXaJNtx+ClY9+uOmy2ykvM/Jlq6kkubvWYpdLqICI9
	 AMQFnzbiNoGVPH4O7s7Fm59xSSCYc3u9XtC6FazD677A5bxdcGn6clJt46u7kfcB7RZ1A
	 DjvINapsDTvxnf+qO0IYEoTxBQXiB8g8cA/gRMrSoNASRugoLElW4MowV0gSDkrT3cGA5
	 mdi26CxSvrlByHuW3mOyaTbsEF+/Q12v0VwPw/4B5tUavE4MDQpm4nQPmiRdPcvXnzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LE1BcVVH7zEc6qfRLayg6Uqh5RJSrPQPBJQY4neVbI=;
	b=OJUYnUQpLLo7KdiZ7odZsPiKISEQu11HmXzBacHp65q5KIefwX4stoTjmjVJiUus0a8a
	 LLXOwuWRlqhyH+gY5nKbdtHupRJv7ZkvejStDUOUdp1u7Y9ZNuDQLNhaUG4qUTOxJVJdV
	 lhk7H6npyy5jh6+dKx4OmpuzDCyaBHPPS9nBZIBbPsFDY8LePARy7eAH6nUdadAh2rlo0
	 bzt/WNZyy5jrdzss+IEMlG3EYbfrtPfwEcBzTIHTRtNJuZXrMYjIM4u41fwF2Z37hKMaE
	 HolDmvjhmehusTTGKD+WpZQvHgKt89tV5ONH92tZY6krwr0u/b4gvHwFcwPy4QlImeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TemjPT1P;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EE3606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EE3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TemjPT1P
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a07078200fso4297556b3a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786844; x=1796391644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LE1BcVVH7zEc6qfRLayg6Uqh5RJSrPQPBJQY4neVbI=;
        b=TemjPT1PYCXrCtrlGMEwsLLKM1b89Ehunh/TUQUm2DuXh9YR9LmychrTwBTJOBY3X2
         XWybj9F+0Jjoy+xBIevoOnRWWK3/Ep4DeSCAKbLOXavUXQOAa91k9s9uqmAB5RqLN2og
         DahD833A8zFojvbde7DDbqacUwE8CtwOFBWcv9sJjFaU3/McaiyLIOscO5QX4uANW/eO
         IybnsCMRLXkDMMaM98894PKWLxUx56brUBsQOrscilppESS0ufUAJ7r5W/AxekFfUCJZ
         LaYmPv8tYnymhI3bxnA/qjY3dKdzjaAod0NtNrHsW1577vBb1/WK1bOQThPjzXxnKysi
         yZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786844; x=1796391644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LE1BcVVH7zEc6qfRLayg6Uqh5RJSrPQPBJQY4neVbI=;
        b=RgTgcmOSz/prIUHarqt+pAmzc13GO1GsADPBzE3rX9RYL92Yrbst2cawB0DGgUdGQa
         I+YqufVdJY9uBwupshz0hQZlcaJtzXl0EhuaDFvIBQwF1HkEhjNrKolcMN88zkWLzUz6
         eBkeJIdks9RY0SsD00Amk5WVYHhhHFycs8VlonFrdkrZjzr0Tls+L7n6D+B8JwesCXao
         QtZb0DVJc/6UyOJA9gCA+AwxMJ6xtF6YL5ndnAv4yn7kQAqF7pnlgvoFaygCKY19Wsfu
         YZM6fP93xGB/148Y8vDkfGZ/dSe/S63i156Dd7L5LaOmdtqKHUhEMtRY5j5JSzNWRhsY
         qybg==
X-Forwarded-Encrypted: i=1; AL+hErHXW82eTsq2muec984sCn7vpWDw4KmkWJb3c9Vm0CJjAaYBfVwrjRsMGUDDtI2hgyL5Xm7yPyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z85c3DQoSKRbBs0Px1padkS4tKpSORl3XSxMjXvf6I6t23iM53q
	hxJYgCOHqbFRo3YwJfCC/nTyoAGzgNmB8wqeIQ9QHXJNCNgYdFPt+ZZ3
X-Gm-Gg: AZFdTZfsg18D3Ix8nqJCZFR5tvTSrt8a07CV6PRUinQ8DmgJhzzRJFGpBD8gM5Ma/1G
	nt8zoC51U1952TWyFFbXH0AuqYyOZmqrThL47EKu6tMaUdmq9Cv/aA0/wQJj3dkBVx4uM5y2Fzs
	ZIGsWXuNhKYpojIjheL2Xbqy822Za909nfnl9EqnoTaGfdMGj/CKC3KQ+PiOBBEVZmNMV4MfDHe
	nlG1VvUWGqv8ww+IB6XHCxF+MJKWnIRck2Mh4OYU2Q6Zz2KUMCVNpO+k3BXvoQZqSPmUWHuGTnn
	D9018hSfNxRfXRg3BUy354te1sWxJtRr7bl/kv3lQPZT/aH9VVw8nl4gsrGAcPS5gJ7EbbYq5WU
	t4Z65bL1WTDRDjdQFKYPebp22dcEnXi9OjzZgxIxPGFW9TxpIJVK85GMv/DgAdkakoHg+WslvBi
	GgSVghS2QVDxawp30sLermYP67MOlRr8oDJkcKmODutzljYY/S2rUh13cLt8+26DoZOEpX54oyY
	IwzV1DYqbhjVJdVf5plqFiU1Cl2L8npvFp5ayFZeCoaXI5zWBvYJMMEGe6G2roI8l/6RR0EGoyN
	+ksTvuthWhIymh5OGd8V7YSryAdVEtKWnshmY28QaZNRCD6nmEZtgh9EgJvEBd4nUzZHswLKwfS
	XdrQReBajIH3kn8lxj+iLTvCTdV+8aRb5qhxQjwL5NvhKDIAJPjTUV2FHxnAFVtPdPyQNWP22zw
	dyLJnHFXnYhuVMTlJek62yKRMx5RVlEVLST/Yd1Ls=
X-Received: by 2002:a05:6a00:a0b:b0:881:4b47:f30b with SMTP id d2e1a72fcca58-8c87baca629mr21852554b3a.12.1795786844449;
        Fri, 27 Nov 2026 05:40:44 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:44 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 2/5] nfc: pn533: clear resp after queueing to avoid double free
Date: Fri, 27 Nov 2026 21:40:26 +0800
Message-ID: <20261127134029.1813-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

In both pn533_data_exchange_complete() and pn533_tm_get_data_complete(),
resp is queued onto dev->resp_q before calling pn533_build_response().
If pn533_build_response() fails to allocate the reassembled skb, it
purges dev->resp_q (freeing resp) and returns NULL, after which the
error label calls dev_kfree_skb(resp) on the already-freed skb.

Clear resp immediately after queueing it to dev->resp_q in both
completion handlers so subsequent error handling cannot double-free it.

Found by static call-chain audit and code inspection.

Fixes: 6ff73fd239ff ("NFC: pn533 Rx chaining support")
Fixes: 3c13b244de96 ("NFC: pn533: Add support for incoming fragmented frame in target mode")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e5..c42cc33 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1104,6 +1104,7 @@ static int pn533_tm_get_data_complete(struct pn533 *dev, void *arg,
 	}
 
 	skb_queue_tail(&dev->resp_q, resp);
+	resp = NULL;
 
 	if (mi) {
 		queue_work(dev->wq, &dev->mi_tm_rx_work);
@@ -2138,6 +2139,7 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
 	}
 
 	skb_queue_tail(&dev->resp_q, resp);
+	resp = NULL;
 
 	if (mi) {
 		dev->cmd_complete_mi_arg = arg;
-- 
2.51.0.windows.1

