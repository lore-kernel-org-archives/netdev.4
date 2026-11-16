Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861002;
	b=m6UKUVnnT/Azpi3czocJkk4IY1B5k1X2/qBEoJBg54kXTkB60IE+TrBG4bnNyND86jqn
	 YSGHs0UXddNEGl1DF86E7RF4whPFnvFU0PN1c+OZlwaf7ZpfjCGPm+CLA+2aJD1MwKONs
	 RdbR/iehHGxQwKEP7PuLjsfnyDtMuMeooLLnCArHm3ojtfbLgi4eIg624PBhMPORzyqei
	 36mNIcGnL/ioQnBuXRV0pD8wzTdAt7HbzY07gjV5YDHOI5acuYVdfGuxSKX6RK5Gpkws8
	 UuV7UUIVvXYgkCh5HksHtrZj03V9nCqTIiOfI9L5uTqy8FGJsUHr96/3AJzTTJcrCfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
	b=XVS3bxojUJcIXwcNBHD1JQVgtqyASw4cdqXx/GcMNXvvQI5C5wHcpeyO4rNtXKcWHtm8
	 tSTSPI0aVJo+meP0d19oo9vF2XL1E7Ncecn3LmJ7VCYiopJEqlhOgcOQrdYYbhoyShoHQ
	 j2Rbul8WZistNChARD3dh6HuygX5miPZ/NGsmJfKxY90afQoqp7xSKq8ZNdanwMaBKWrc
	 +tSQTIB6oHekup1cm7PLLK4VJWEnv65npYNdsLNPVkrJ+ZKK61Fq2sMH6J3g1vywVnBGQ
	 qsKx7gSai0ohGetvappjLY9m5vaEC1BcxIMCKmVUX08TtAAKR5n4nzZG0dw7FROziRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKFpELSX;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D528606A33F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D528606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKFpELSX
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1892549b3a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861001; x=1795465801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
        b=TKFpELSXuwyuojbbJSKyrDZRsSdBhiTG7m12TMAu8be6TZ9CeJr9YzaOdAlEvCm9f3
         Jf7PyJ055qL7HnN06ZZlEEKr/g0NndKqsTguKjqvpUsHWrmwLUKxLIXc1WPBR9AYexGm
         GfNUeakjoMzidTrqM5VFA502x+jjpMdamSidBqfRFPa5Itblky+WrgXzE3gy6pCJRBen
         t4oVU6Y15EOhiaDDhw8N1gTZqCKV3I2i6Iv/PBsmX+M6kvlorjw1wR2k4ruOD2vufDYt
         fttNg2ZsIYYhx6uvYgbUvGfhoSySPT12fAYwLEi7XrM7lZsXCkEhrKvFVWKk3mso11Za
         pRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861001; x=1795465801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
        b=HbQ0+AHuzaDB5QU0rveRAOuvhpFKTch9NS3w61ZPuSz33JrNndVVbnEHZTpdylFYUZ
         Vn5lhqnJ0VyqKZpoqMTk2SNCz7c9SCIGzG+5R3Qi+Gq6zji00xOsoBpBoN2ecBIS1RA6
         ENuVmz+hWBZkvDlzsVzingbsLgWe+KoXyI9GHVXgYfDuoHvyN/AMOtERnG6xFWOOCQfO
         gWkNSA5ZdJIEf4Jkh/QIApFcKX6OvSEILAsUyS8oMBYVzUZqT9XgtovAu2AMBd15wkXw
         xjhX6PjOxejjLye4c37OiDSOTxXGxkbbOKxj1lckIbCDMFawA2mo/lPaXXjFJNUhJDiR
         tOgQ==
X-Forwarded-Encrypted: i=1; AL+hErFKfQRKWt5r04IHrHvI8mzeo1vi1D7O9NrYx0znnMdVVr7LLcOdp/iVzDaqQzHRLcHppfJMpPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z84RhP0hiYkVJIoJ87ZJ06K5hRzU5dBGbuobI0FYmERTkIbsHlY
	/4HlXUEU8mPzvhHxRPcccfB/hnVqPzYeTZCXr7MfDvcDuKdlbEDwH3Np
X-Gm-Gg: AYBFou0j/QHMmZdsqPJK8oL8mC1nVqB3W8oALXFxuASqkawahkEaYcPUnsgCNWq3pNR
	1hyJ/+95lBSVwv9B9SUoW4K6adL8BJHHqKockD/oumTsLUGPngNjxE7PsPH4HDJo2cC9UgwhIJV
	QIRFsBo/8/WoQQ69tA29f6Ng1qsDHibR0nNA7b+xm89eO1+WzC4IV8vTdpyQ8Q/BTSlZhnoexeu
	w/5UCT/8DxE9UEYQt0Pr8mbPE9eEae+B1umEWhf3o/BOq1qe0wnab7pjSwnU9kvV3/39hzfC0eP
	YanwgBwQX2DoDRDqe6vq6dD2YziP86O04NcP80K4cdNxcB7K7KRBIDc5fhyzI+z8LI2ihxByjqX
	6LCD/xTCsnxuj4X0yGniFJ4lVZdf7vsLZBOhpUektLT56FXiWtX0HZ6HqF59Cf93Zzgg423WEvZ
	4HaDsJxONpsQ5kmXQFuXEW9xI5FjwkZpYHceknvpFFUx3bevY1lkqRAC7kJ6VgoYqi+RC5vgh+c
	GeSRaM9uU+qtkZG3zCfWRoXXCD4MApFs89Fr62LgAR3+Fw97gwa6ZxMUcd/Gl78zEfPam1IHbZn
	pqnnkHSzA+07KGMMTqToCTcjFx6H0lOFnRc=
X-Received: by 2002:a05:6a00:4f88:b0:89e:cfbb:e8af with SMTP id d2e1a72fcca58-8beb21cafefmr9646030b3a.6.1794861000928;
        Mon, 16 Nov 2026 12:30:00 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:72::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2f06cd7sm4222793b3a.57.2026.11.16.12.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:30:00 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 2/4] eth: fbnic: skip disabled Tx rings when setting the queue NAPI
Date: Mon, 16 Nov 2026 12:29:55 -0800
Message-ID: <20261116202957.3601684-3-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

When Rx and Tx channels are not combined, each Rx vector gets a Tx
triad whose sub0 is disabled with a q_idx of 0. fbnic_set_netif_napi()
and fbnic_reset_netif_napi() don't skip it, so every Rx vector
associates Tx queue 0 with its own NAPI, and the netlink queue info
reports the wrong NAPI for Tx queue 0.

This bug was found by AI and verified on HW.

Reproduced with "ethtool -L eth0 combined 0 rx 34 tx 34", and reading
the NAPI IDs with "ynl --family netdev --dump queue-get":

  before: tx 0 napi-id 580, tx 1 napi-id 514, rx 33 napi-id 580
                       ^^^ rx 33's NAPI, not vector 0's
  after:  tx 0 napi-id 513, tx 1 napi-id 514, rx 33 napi-id 580

Fixes: cf4facfb132a ("eth: fbnic: Add support for XDP queues")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 5efed21e5932..89e7b806363b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -2184,6 +2184,9 @@ static void fbnic_set_netif_napi(struct fbnic_napi_vector *nv)
 	for (i = 0; i < nv->txt_count; i++) {
 		struct fbnic_q_triad *qt = &nv->qt[i];
 
+		if (qt->sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
+
 		netif_queue_set_napi(nv->napi.dev, qt->sub0.q_idx,
 				     NETDEV_QUEUE_TYPE_TX, &nv->napi);
 	}
@@ -2205,6 +2208,9 @@ static void fbnic_reset_netif_napi(struct fbnic_napi_vector *nv)
 	for (i = 0; i < nv->txt_count; i++) {
 		struct fbnic_q_triad *qt = &nv->qt[i];
 
+		if (qt->sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
+
 		netif_queue_set_napi(nv->napi.dev, qt->sub0.q_idx,
 				     NETDEV_QUEUE_TYPE_TX, NULL);
 	}
-- 
2.52.1

