Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657415;
	b=XbZCB1EGwyjVYyKQnULh0UlNcMkcrdRay+3iiL3MOS4pivnYG7rnQl3TMb0mpNFX/R+X
	 l+kS6QyVEsERUM/Pa/XYUovwzxPPPiCwVkoav1Vz+82Cu70C9xJjKROFovZLnjZpjIuXQ
	 ppxSaxsor1oiCqSPa+vmw5lIc7aFT3Ml7bTkdDKf+X2zkBvejFWVl1iG5TQoT3YOnwSl/
	 kOezT0gVxc2tyFPxAZNWC26hzx1rRXmhnV8H7/tYMGvpXFHYXRyzWfhY0uNXWt7vSeT0f
	 9y3Svc37nHZ0MmU++kvO6CXTH/K/u0mU24Ddz2ibV3W9gtIsSWvwLvbQ+u5m0rytSlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cSuKKGKVatVw0MycJkFJE0xzxW+d/sdJKq3FZVoeGr8=;
	b=2VII1CRed3gXOOMD7tLg9hctOOJHGf3uEfVZOOsQp7Z4p/udd5yN8uHcSwFgax4Mb/+W
	 BYpzzjJOkmXauEwn4YXI6L/YI6Rr1jCqmvMHqhpa0aJseG779xVXFISEIYWLxZRqtclnd
	 f6o6U0MsU1g76WSoU3mhwILJUkbEuB+CDKFQq/wns1RDHTmzkDY3iVQwR3IqIgQT0piEq
	 KI+3YokvQ38qkdg3uJARMY4xekmrEt3Dgz466X6j1gKa/xuyY3oldNCBWD7f5GbV9OYAP
	 oqdCnV11xyt8LYQsytOp8MuRkiN2L0vV3yj5ZkCZPYwHr06BKC0Mq5tVvcE9qeh0ecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=es+AnvB6;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A1606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=es+AnvB6
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-949dcf80821so382188185a.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795657413; x=1796262213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSuKKGKVatVw0MycJkFJE0xzxW+d/sdJKq3FZVoeGr8=;
        b=es+AnvB6TC1xPyuh8sNQolmX/jwH0VcNb8TkWFH9imrwaoLhi1quxH3o89onKbOkI5
         OtB4/fqndVygry3M5yLwFI0Isk33coTSBM6paM0g/i4lVUZhRujvYc4HWQ6GrsApm/1w
         Q6sEwxJZF4vqIHPsjaJU6M+gxzBsxFaflOC0ccyqD5k/x1q4FIOfpDZOP8bBETQVuBPt
         BFC3QNe8NVlySsFQNqVua6eAogxM4XLNVYBmSlDT9/xx8pr8GVXXD6g4nQ+go3mC8svT
         L4tRL5aKxXo6FIgijs4q5LiH6saYzIYE6hC8fYwwAw7Bk5ridnlHhSutPk5MqEdpMKpk
         Va+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657413; x=1796262213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSuKKGKVatVw0MycJkFJE0xzxW+d/sdJKq3FZVoeGr8=;
        b=vzAt4KrZYiYtMcQD3Ym5iYUdS5p2d64C+LwA+eiltUiAX3q67YSjRke7feOoCEQ2q9
         /qCQ2elFhZzAeWZnb7WT1g3vK6vcximzugOJDClA7BANoV1y2APSBvaqCEUsVEPVhPBm
         4zKMRQ4L8WAVz8WeKOy5fsMXyVqDFuAsOT8OIe6oqely/9qJwkdLjyc6DEs+7ZdCdKWR
         VUF/1eWwEL9uXV82ay+UsXuE6UlfpoGaIR33sKpD+3ichucrsKrrvxjslgHwETKnil59
         wSVzpyko61HKK39pkUZV1+RUGgcGyJtg1UHnrKeKbqpnMo1oEg3SZMkmbNR4ykG3uc+E
         wNqg==
X-Gm-Message-State: APuU4Z9nyunnjlEISweysbbNc2dflhGjV2+PUJkWBXd+0tRv5H+jjNrL
	5TK2V5R56G/RDyKqxDdPjzC8qDXieg+L/kAGANMzVI6NL/HI1olDAgj3LZRduVH9UZB1xDqoiVd
	90utOEHwFWmj1Png01VOzKBx4PjO9H0/lkga87nPqTImxhnxmt5YGzi6Cl3tRJfnnLXGppnFCTI
	d13ooxVN8w8V48fsjCwnkkfhblwG2guQLrQBY1n5zWjfuO8cTWxfuY/7liX3jNSBXNc36a9gMv2
	D8H3thj62CnSmc=
X-Gm-Gg: AZFdTZfsxBUoECNVwV8bvyRnSarG2V5BYPl7kYIvy18EBFK3U51pl7cLdpkEJbeysUi
	wAmIDW3owsx7UV1xsN5gmh19jd5JVI5ivEjbojJgie7qecom/znPA7zQmQkcejgDEAeZDUKG0k9
	clhXueBGlVddP3iHul31ygo3TLtFl8u9QcMUUAb30d1at4RE1qiVld2Eo3WDEChU/xi2c2weTXw
	GIBgFBIlEU3/fhzHMJFI5bt3aKPjTgWU6aviS4HNGoWbbNdFkVz8Sbv/6mlOJJ40AWqgHOd1G1O
	b93OhHaWHeBRJw6/udyNovbhS1gN19Wy4Vj1bBJ2CLHVccY19SO7E+WrRvIhpzkFj1kgv+0nzpb
	OKI2JCuxmzLYjFhWu7PUMInrI/ZCrxtuQKB0=
X-Received: by 2002:a05:620a:4556:b0:93e:bcbe:f709 with SMTP id af79cd13be357-949ba9b3944mr3353047485a.16.1795657413204;
        Wed, 25 Nov 2026 17:43:33 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb396d99sm153884085a.13.2026.11.25.17.43.33
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:43:33 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 98F9D400B7;
	Wed, 25 Nov 2026 18:43:32 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 930A6DC0C28; Wed, 25 Nov 2026 18:43:32 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net v7 0/3] tls: fix device-down socket lifetime and offload state
Date: Wed, 25 Nov 2026 18:42:41 -0700
Message-ID: <20261126014327.1638133-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes a socket use-after-free and incorrect TX/RX driver-state
handling in tls_device_down().

Patch 1 sets sk_validate_xmit_skb while holding tls_device_lock, before
tls_device_queue_ctx_destruction() can drop the socket's context reference
and allow __sk_destruct() to free the socket.

Patch 2 installs tls_validate_xmit_skb_sw() only on hardware-TX sockets,
leaving RX-only and software-TX sockets unchanged. Setup publishes
tls_validate_xmit_skb() before releasing device_offload_lock, and
TLS_TX_DEV_DOWN records the replacement for the TX tls_dev_del() call
without relying on tx_conf.

Patch 3 extends the existing TLS_RX_DEV_CLOSED flag to include RX driver
state that was never installed. Setup and deletion update the flag under
device_offload_lock, allowing tls_device_down() to decide whether to call
the RX tls_dev_del() without reading rx_conf before setup publishes it.

Changes in v7:
- Split the device-down classification patch into separate TX
  (tls_validate_xmit_skb_sw() on RX-only sockets) and RX
  (TLS_RX_DEV_CLOSED extended to "never installed") fixes.
- Commit messages: name the functions involved instead of "the
  destructor", "the validator" and "the fallback".
- Drop the added comment in tls_device_down().
- Move the f08d8c1bb97c dependency into the Cc: stable line.

Changes in v6:
- Resolved the conflict with the recent fix.

Changes in v5:
- Reorder: the socket use-after-free fix is now patch 1.

v6: https://lore.kernel.org/netdev/20261123222947.1014041-1-rjethwani@purestorage.com/
v5: https://lore.kernel.org/netdev/20261116183519.3314837-1-rjethwani@purestorage.com/
v4: https://lore.kernel.org/netdev/20261111232930.2532497-1-rjethwani@purestorage.com/

Rishikesh Jethwani (3):
  tls: fix socket use-after-free during device-down
  tls: restrict device-down TX fallback to hardware TX sockets
  tls: use TLS_RX_DEV_CLOSED to skip RX tls_dev_del in device-down

 include/net/tls.h    | 10 ++++++----
 net/tls/tls_device.c | 28 +++++++++++++++++-----------
 net/tls/tls_main.c   |  1 +
 3 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.50.1

