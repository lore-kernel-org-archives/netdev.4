Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099371;
	b=JumQgkeyOoeny62bPpR3iZH8gOpQ0MFaaevoafEKKxdI8qQ0gelhcAWIxJ1iCZW3IpiQ
	 m0kI11Fg+O4HhWCHukWktnEF2ZqR7famMyKyFJMxxPWLXrrswGTM83hb04Nf+wNDUd7EK
	 BqMoMBXOCVKfJZ5N9Ffv0NAwhSy7LbEVosPG4v3fHsabNWgbRb8+hJp0yBdns6L2NgsAM
	 FLS/jcALkEzE3QCnJ4+DrmnOglfPZRKhaNsXsrXi7EuJ4oXloi9rjnkJWmMWN9xuDq4An
	 MdQy415hG9lag4Vm5jaualVkB4RxRsvl/OVMyQ7vzeCIHvNiQFB1OqhL+v23FDc1JUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
	b=WYOqHAaEgEg8kJS9Yv3W9lhsJOFmcUYNs6afl8xUl/zLrxrU3ClEZ7wTJ8oPPqGB6Q2E
	 X/CRONtHNoPqZqQCCb5cxyE9UUYdHX5g6sP00OupoWj3KxhmQklHzAPE0kpkNVxm1jCxt
	 a0zIvCzmTbRlbo7dTg9O2+YlkcYanf3cziXtLW9Ur74AXWF7zthtnUghgX8EAAG5I6eXw
	 /RUVxsCRqCYOwfl35XgdleQIwcXXB139ECAiQWc7PMMVgjwrKrkXQ5OUdk8FbbMJ+l3/J
	 iIJOw9hABeReSj4yeKlEAEOe+aKBZIex7e/mKNtn/ga7EZb3nSnlglXOkevktAKwmsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWRUJC44;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECF606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47ECF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWRUJC44
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so5287332eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099370; x=1795704170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
        b=QWRUJC44BrmfZY+w2pGbGJ6vxwqJppP7pq9pMep5n40I/NcvyQYifDPS73XMySn8RE
         qELnVmv+5heGDMqxLOTYJABjbghIX5wjgqFnAOTRcyfPANiIWqCZHB8hkQ6Z3CiPhjbf
         4o/Xc1FSs68jgMySqFLhmvY9xlxLirm6AcnOryju3Irq7FmHS6HowwiU+VTnhcgkRWJw
         HjCoRWsM3yUKe5JDG8Xa30ek5Tfxy5RiZLnbmqVtZ0Io53UxA5GLeChbX2mnLdCwTGmP
         LGvoD7cj3WfsZ88t+Uf3DdCvXfcL4bJqP6HfcnL0SYOndbpywjpNcdnLrdeEkIGnFUci
         QoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099370; x=1795704170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
        b=nTSdrsjd3Y/YjfD4uIl8E/DRpdHF7Nl646WZsvAK899ibS9OFMXY+842ERJ+sW9Fr4
         ljpqEPCwQmOvJoa8UD6EAmBNFs9flqZYbqfAqsouBYnI5iwUmnilEvDYNg10jqo52U9X
         AP9DnTnI9Y8InnE10cPLnV1U8S/OUa1QOD2O6DvXkdUSHieGakZHxYcdS+KXCGsIkdOQ
         60IEDM21RQbYEUHYDoxw1JBxxGBCaPpHt9q0pY3dgjACeHNUHzD8ldwKqW+xmwj0812+
         mjCNcKV82uvznTY6aMhn/0htcSm9c1oHCQilbObB8MTWvijL3gdVlX/4JwHXMVDYQg2B
         hBAQ==
X-Forwarded-Encrypted: i=1; AL+hErEAEzOAvOcUEVIfHO0k08cr0qbrG8iL1azxqXOOHWksH9AnqjfDwY65AiL39PiKOCEJcQOwUO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8un6ysZSF5N8ZMrlaCGSHOTYbz9vQroRdaw8pE0IwDy33c9i4w
	cv2OD4BsDMlvjCRnbJKM3UuWaV7HbndWmwYBhkPIqcN1pyB5YTHyHFt9
X-Gm-Gg: AZFdTZdVZiYsskuqMuvcj0IKw7NUe3bYYaJUMO7T+8KQvqZ66J6GNEVMQi+GNiepFKU
	UaYTRq3PTBqJj0bQ0BK1hK4VhzQnbBA9Kl/ufBSPCOjgPfXG4v5wramstAvUgElM2i7PafzqSdy
	DWSLPtxm2XOTLQcOZwTZyAqKMt0NiA36nUaD7HtyjchZZ+Q7wWfUCq+g9btoRr/2HJTMiNWshrb
	Cpb68GcOcX+XXqtcM8lgBIeHoiQDz/SCMXg2eOEIZChZBiiS5D69EtDs9yLXRXcEnK7ntV5ve3r
	GmEg7x5Bm0bxhvSsfwRlX5OsKkDMpoMHvDQX5r/fGlcVuO1hO5RMFnqueKfC9YF0dPNn/zkaGzm
	mfEcZQO0DsmEutpmrufkwCSJArvnsFL3Txt/B8vVbRhPnJ4l+83eTJg9sX/SrJHY43nzGNu7vyc
	8pTSXUXEhUF+jai8nC7tVkUklfjZm9XYBbH369FN53hP7EpwutgtWAhzEMuHehxVkfYGyNZuzXz
	o+Ec56a4x1oO9VyDl3AQHlA6aQfRqBJuX/yVMEWDnWiIphvRJ+VHg2DamOvpKN2v3x93l3lAmTr
	XxUHC9DEMl5LXxeOc1qHz2qFqvbBp0iLw2HhcJqfwTPbIzJ/Gg==
X-Received: by 2002:a05:7301:e0c8:b0:376:5b99:a816 with SMTP id 5a478bee46e88-3827d71efffmr5784100eec.3.1795099370298;
        Thu, 19 Nov 2026 06:42:50 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:49 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/4] tun, tap: bound vnet header and skb copy lengths
Date: Thu, 19 Nov 2026 23:42:35 +0900
Message-ID: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

There are two independent length mismatches in tun and tap TX paths.
Since v6.15, __tun_vnet_hdr_get() has compared hdr_len with an iterator
count that still includes configured virtio header padding. A 512-byte
header, hdr_len of 256, and a 14-byte Ethernet frame pass that check
even though only 14 payload bytes remain after the padding is skipped.
Commit 2506251e81d1 ("tun: Decouple vnet handling") introduced this
ordering for tun. Commit 6a53fc5a8770 ("tap: Use tun's vnet-related
code") brought the common parser into tap.

An older zero-copy issue also affects both drivers when hdr_len is zero.
With a 246-byte padded header and a 14-byte frame, the full 260-byte
vhost descriptor crosses its 256-byte zero-copy threshold. The drivers
choose GOODCOPY_LEN (128) without limiting it to the remaining frame,
allowing an skb to carry uncopied bytes. Commit 97bc3633bec7
("macvtap: macvtapTX zero-copy support") added the tap calculation.
Commit 0690899b4d45 ("tun: experimental zero copy tx support") added
the matching tun path.

Patch 1 validates hdr_len after skipping padding. Patches 2 and 3 bound
the zero-copy skb head to the remaining payload in tap and tun. Patch 4
adds direct-write regression tests for both drivers.

Clamping keeps valid short frames on the zero-copy completion path.
A normal-copy fallback would complete the vhost ubuf_info with failure
and increase tx_zcopy_err. Without packet-socket listeners, 401 short
frames completed without raising that counter.

Changes since v2:
- Separate the v6.15 header validation regression from the older
  GOODCOPY_LEN issue and fix the shared parser.
- Add the matching tun zero-copy fix and tun/macvtap selftests.
- Retain the tap copylen clamp, with its original macvtap Fixes tag.

An AI coding assistant assisted with analysis, code and reproducer
preparation. In x86-64 QEMU/vhost-net, both drivers now deliver only
14 bytes for the short-frame case and reject the oversized hdr_len
case with -EINVAL. The patched kernel passed all 105 tun and five tap
selftests.

---
v2: https://lore.kernel.org/netdev/20261118120102.3717000-1-graypanda.inzag@gmail.com/
v1: https://lore.kernel.org/netdev/20261113164903.785381-1-graypanda.inzag@gmail.com/

Junyoung Jang (4):
  net: tun_vnet: validate hdr_len after skipping header padding
  tap: clamp zero-copy copylen to remaining payload length
  tun: clamp zero-copy copylen to remaining payload length
  selftests: net: check padded vnet hdr_len in tun and tap

 drivers/net/tap.c                 |  2 ++
 drivers/net/tun.c                 |  1 +
 drivers/net/tun_vnet.h            |  3 +--
 tools/testing/selftests/net/tap.c | 29 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/tun.c | 31 +++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0

