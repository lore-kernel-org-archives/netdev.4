Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003271;
	b=qQ6mtnrCBXE3V+UD6UB+KZO+BbkZyc6uMuOl4XrBbsthVWSqDsQx0AYZfFXpolV5aXHR
	 B4EvdrtuM7x5oCa44gJX9r2u/nYyuSIUGQDWQbav7OfsoNLCFze+E0vGgWFJUiZFsPYTd
	 KUCigOr9ZXTPmsIeKssnrqg+xLeq7FOFqn7wmaP35HXHmqn0swO9YyALr0d4diuhuEM8J
	 gC1KcIcmmBi9H8w9JQeZfl9E/6iAyOpjOGIfnvPrNSpMLVhoSdwVE5OXDyAfLm8PZAmGb
	 Sf+oSpqK1mfJQWZ0yv+JszTGmuHQRVDmI60ka6HWft/1hfqsLRlpDiD6qpC49YHNSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1c90KFVvzpFDqnGvEd8sXMtLzVt9oSB8UiZ61ce5p98=;
	b=shS7sqj3W0Zz/yLBzhyZ7N2jZoViOLlVVXFkKaWCTIxndXAhrbujsnod/x9SEiBWn/ca
	 sUGeLQ0yHy5Odl0NtpoD/BSMjGTxN3bIPKtUpQJ1ZLNJn4KXmxog/KUO6ift9+24Lvd3T
	 BudFr0B+qwvb8bY+RYnuG1O3yhPGMSpmUV70x5LmA/ruwAIde7gBGyb7CJ8KICEs9H/6q
	 ZX9Xykps4QftQC+N9PdBvglSldDEr83mzziRTL/ZW/OOHFaMiSinHZgUrFmT5lQiYuXI3
	 h5Q3x04l8xY0y0obE8bCE/TCU5j5EcnqNFf8szyKZCFO/231wDWnK8kicEx5HUzsu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7nPcD0M;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDABC606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDABC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7nPcD0M
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b2382bf051so566358b3a.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 04:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003270; x=1795608070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1c90KFVvzpFDqnGvEd8sXMtLzVt9oSB8UiZ61ce5p98=;
        b=m7nPcD0MsmFjwaSi0bTu3XZBB4Bvzdi8UzkKfUfnAjo0PAp7SxyrOh555DMvwuQlrQ
         a3SDjgg9/bmEuDfxcQP6k4IA3ny/wYt5w+1FGTVrnWmWQilwYeGKALWG8kOLlCFJ3Hk4
         1+72ZTgoynsRxhN+fUpy/MnCRU7W325ASLYiNAJrWG/4eqGM4fRpk6dRStVypWmAVJ5C
         u9j1JwL9N8dws6FTEb3AiwX4SSUKI7lw7l/orjml7n4SsQEkDYWQz3tkWCTLOKy7VOp5
         XKamIegSpU+xhBI16DbBwZ3AC1HYS8uh0fVjJc2gj5lGiJdFNiQIr2dkLKdbmB4pl8+P
         SmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003270; x=1795608070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c90KFVvzpFDqnGvEd8sXMtLzVt9oSB8UiZ61ce5p98=;
        b=uDWaEMbG/ZKb0sLTF8u+eTa/g4IbXGJhGuGQl1YyhVkcnj8mMty+Mb6h8KuoToyezi
         8LJbk/bwvoeG+SqjCqt9giUOSE/xlsie3uNQxR9FEKbogfC1zOOMOogtJIBeZECVU5uI
         s1xO0NiljmT6tgiRv7UrmGEfIURh9aDYbQarVa9Hvak8I2QoiLlUBW1W5tHyoOf5dtUO
         YRM9W7ZG1LKzuQhYKi/5spiLKs3Mv6g70JUBnIyEU3/sgdp3dbFN46//Ht1eAt1p/r/S
         RalCLVICwilnZmyHATEYbCFA1lCSpJxPNFi0UNOb1vg2nAzBhN2aLPFZz/j++yk8L8y+
         y/+g==
X-Forwarded-Encrypted: i=1; AL+hErFmDzmW7o0+aXQT6F15/adGV4y6BlhPwCnI80crSoyhiMNQ8CC5+al7zzlzA75mIlbguCwr5m0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AnsUtzCtoHzCvh2qVlfx/N+EqmXjXleEmFmPtdAjrLuMqXUo4
	3zZusgjwDeZhPFswiyBOmSaVdZzj57JWWFU2/tHt6zsFqTa5eid+dA53w5r9MMi3
X-Gm-Gg: AYBFou0jY6SkpncC/CZsU+92LeRelrGcJf1enuoZ7+8QwCONAvUlzvOV7Q5jSc8SOSo
	KVd8M+zAYW5JETYIhRfsRC/dqgzyom+d5i/Nmcf/Ooo5ioyQpFk1XqvZgk20ckyCjGgE6JoOgWM
	agDEmCGQORjqhDf8ctTUsW6k9abChEGbdDBl9ZQpRnt87032em9x+1N29eM5KBuVnsviUULFb4y
	zkpIokvT3Qyoxh0kgU5oCytIs7EDtevkNRkrxYYziyf4F9CK28krlQd4sGCEWXGZKKpe9FzGyWE
	1E/GGbkSJHszh+1R8kI1jXNKlD6BLnLXL7tRFOeGVmjSujGS9UJU+unIBBrsNtW2KXHTT2nR2fs
	zrw67g4h4EKC8PES9uad0Liu9GIg0DIdURIzzvt7ecI5/VQoI31KR9d7RuyEh/WwPQ6UnO+YASs
	EW/+6N0X5Um/MmRNvJ9eyYX1216xUTWkOLinFJ2hufBYuRWNY3TXBTvrTlsc9XCEv43mR3weAYl
	pC99LFnLtX5yKABx6rvf8KYEA/jIfy8G8sMj6BgN4MU8Xj0eHrxZ0LifiqReqtzUSefiqjPwRDK
	2PcYqkp1U6mBXK35yAbPj+twdyO06th6v4jdEyJKfi6igSkS0qmAvlqBHISMQmFeRbdZpqQ=
X-Received: by 2002:a05:6a00:1820:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-8c5d44e78a5mr2240369b3a.24.1795003269690;
        Wed, 18 Nov 2026 04:01:09 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm1115220b3a.43.2026.11.18.04.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:01:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tap: clamp zero-copy copylen to remaining payload length
Date: Wed, 18 Nov 2026 21:01:00 +0900
Message-ID: <20261118120102.3717000-1-graypanda.inzag@gmail.com>
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

tap_get_user() derives the linear copy length for zero-copy TX from
hdr_len or GOODCOPY_LEN without bounding it to the payload remaining
after the virtio header. tap_alloc_skb() exposes that length in the skb,
but zerocopy_sg_from_iter() copies only the available payload bytes.
The unfilled tail is transmitted on the underlying link and can expose
stale kernel heap contents.

For example, a 246-byte padded virtio header and a 14-byte Ethernet
frame leave only 14 payload bytes, but a zero hdr_len makes copylen 128.
With a 512-byte virtio header, a guest-supplied hdr_len of 256 also
passes __tun_vnet_hdr_get(): it checks hdr_len before skipping the
padding. That makes copylen 256 for the same 14-byte frame.
Larger padded headers can raise copylen as far as good_linear.

Clamp copylen to the remaining payload length before allocating the
skb. The minimum Ethernet frame size has already been checked.

Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Replace the Fixes placeholder and add the co-developer trailers.
- Document and reproduce the guest hdr_len > GOODCOPY_LEN path.
- Shorten the code comment and keep the C reproducer separate.
- Link to v1: https://lore.kernel.org/netdev/20261113164903.785381-1-graypanda.inzag@gmail.com/

Tested on Linux 7.4.0-rc2 (067c5c24cef2) in x86-64 QEMU/KVM with
two vCPUs, CONFIG_MACVTAP=y, CONFIG_VHOST_NET=y, and CONFIG_VETH=y.
The guest used vhost_net.experimental_zcopytx=1 and init_on_alloc=0.
Each case ran in a fresh VM with TUNSETVNETLE enabled.

Before this patch, with a 14-byte Ethernet payload:

  [POC] case=A
  [POC] case_a_hdr0 received_len=128 expected_user_frame=14
  [POC] case_a_hdr0 tail_bytes=114 tail_nonzero=98
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=128 control=14
  POC_EXIT=0

  [POC] case=B
  [POC] case_b_hdr256 received_len=256 expected_user_frame=14
  [POC] case_b_hdr256 tail_bytes=242 tail_nonzero=82
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=256 control=14
  POC_EXIT=0

With this patch applied, using the same inputs:

  [POC] case=A
  [POC] case_a_hdr0 received_len=14 expected_user_frame=14
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=14 control=14
  POC_EXIT=0

  [POC] case=B
  [POC] case_b_hdr256 received_len=14 expected_user_frame=14
  [POC] control received_len=14 expected_user_frame=14
  [POC] used_idx=2 trigger=14 control=14
  POC_EXIT=0

Disclosure: An in-house LLM-based analysis tool developed by the authors
assisted in surfacing this bug candidate and drafting the initial notes.
All root-cause analysis, patch code, and QEMU/KVM reproducer results
were manually reviewed and independently verified by the authors.

 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..f25c58d6e986 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		struct iov_iter i;
 
 		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
+		/* The remaining payload may be shorter than copylen. */
+		copylen = min_t(unsigned long, copylen, len);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
