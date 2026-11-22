Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307337;
	b=LHwTwxLaXBftcQGIBGEUk/nLkU5iNcBQf6Q/mJb2evyonxjKGaUmsUQwOxdgJOUbnvvR
	 zbiB15QHMQlrwDFsYbGs4eCoEWDC5puZqF2DpkCo7WlTcZwR3IRztSVBKBdw5fb9/+yDx
	 AZMwG4X2ixbEYPwXASXHNzVMzluKXjQFqph/NHqIoSeSoO5WNO+vboUOQ1Whb3iOx/WP1
	 hvvkewZu2nMXtyl34glfRNqHFx0f5UgT6SKm2X9s36drCPiQCkt75RyJj2mb5tIbKJov3
	 XFj7XV6RenWfy1Ej8HaZpnnN504KHPK21KAbiw3rFbsq9XnS/pO8oGQruN0sqvrDaiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kEwc5U8O4vQbo4Iwc4AS9Sem3DHHERb1KNg+gLVf9NM=;
	b=FGnHk4X6YFMAyHrfXDbJoSm/RO/8Lwjx/Hc7TdBJ70fC9MfBZIGoueRqhrmfEajCARCM
	 kIZNvF7O2b/SSx66WoYSk+egoSeDVgdm7gxM6m28fEAhaXMTAWDl27iGh4ylqUMRed5mY
	 SVxqotX54IEDR9k6t7ohStfdaWx/MpnM57Yo2kfaPnMtzhoToP5fse+IHNQ2ck91mgbyY
	 poDA3JE6lNtuK7kdNb9q3aEI8TxcQlp+n06U3JJ7VTAqdt8xxCUXGhUNSKEvHNRhtabpj
	 Rh6AA4cyRWp9daNfyqfbenBhKUvSU2E7wUZNrVKei/MEi5xwh2duUCXGmAUSMDgVi1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZdNmGIk;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DCC606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DCC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZdNmGIk
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2040726f8f.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 16:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307335; x=1795912135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEwc5U8O4vQbo4Iwc4AS9Sem3DHHERb1KNg+gLVf9NM=;
        b=qZdNmGIkT1R5of4m74HHUfh4pAKHEkFDropu34+iPOeDLbUgdOES7Wbt2hJciVE7cN
         cv1/eMghaL8IR07aAYAtgQXRqYC/eNnCxsWeGDOYK6zkMUoF4N09nfrjLWViI9uoeKtZ
         N3ph365VNAFiywNYHA5vN+Kvh20SenJULXh6vO99m3o7guNnHUZ1wkr+WldRXswm4qDt
         fdfjd0Y4js7Xrr0Ak1yFP0oaAM7X7E8rMNx0ewuowyBB4VR5R514UkBgHjqZ771Xwq43
         CnuMEhX9rGt1TRVLTQlvEWdtFIKcmg4CBIZnVzzpfNic6A4VO1zZxeAcrTCxZp7owmvW
         R5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307335; x=1795912135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEwc5U8O4vQbo4Iwc4AS9Sem3DHHERb1KNg+gLVf9NM=;
        b=faIN4T05Y1RcCZIMZw+GI4DrXqvhoH7CLMDjV3RQQ8uIJ+KkuuXEjJvQrsWor67ztZ
         p4klfJB0nYt/ZpzLbU6IotP6c6Lb/tXUkiBMXYgqYW0UdgFJYWYVCDKKSRCAbx7Oydsh
         Fqu9Zoy4/dZpW4LXkTyPPgKRKOXpYAXl9CacOWso9+KFHx/wVk/I73r5VlwS6sD+0lyM
         uTAwgHUaNCZw/VvbbSgBd9DJ3jI2enirk4dkttlgFrWlqA4lNO4sBRcIZCPak5GIDY7L
         i+jv/1eip5aL0vo6e22CvE2W5wacxBer7YfDu4hSnzlZWNzWVFPhf7Im5eipCBHe9csg
         vTLg==
X-Gm-Message-State: APuU4Z8dvU8A9z0o+jrKO9HdX/os8SAMkhqiwGTpJhN89CK2SDfhKjSD
	ccD2l8NslHAhKg3YOLrwrdKn9doc9MaBVETS2J3fb2Fsq2Em497JzaYy
X-Gm-Gg: AZFdTZehOcK5zwJnY17jmpmAyfNoB1QF+33XY0oX02CObk/Ft9w5vxjxpudcF/03sAK
	kLWB/Yr7DuoEqRS6LVo2jmUbEBHEQCluPejc0hFBhiJZInPPsNCjK5lVey9cmSALlU4Lht5QTUw
	nLJHHWrzekK+RXPllGuVPdrL9mNTdAWhghRzFM/eeEo8gtFQ/J5NB5rNTwqZTMwOEJRdHTMI/mz
	yJUhMlBWkFe3Zidq42SEMvNb+wFC/RRiFneGVaN+E8Fa6Vk1bLGZqBa5LeR1+L6E62yKCIvJW8y
	M7wusFeaUgjRHEU/wOv0XvVmzpCTywj0JWy9pJKlh9ARb7Ij9B6BxfwBGcSLsulv/EddTltgOmL
	FAtwYdBNYnT1unGzZbCoQ3S8BVxF8xbvQ7P9T9wQTywxR6d6eGWIhYhUl/BSLn4aS+0TDpShym8
	eQqWs6JFlhUSrJvb1fWHunFNl9cltrMOP2QiC2ykTpb71a/q7n38v5kBDr70Kuq0JuzlOlypdXz
	SQEG4otlH5WTCwbVgACKKF1iAo1f3nlhQXTEcmzjBwaTMqfG0ja5QBF3eMnRK0ivkI/mq7m2qgr
	INcMXkB5Dwt3/4TQcPQpzHuHIhppaOBkXmBogsvZ
X-Received: by 2002:a05:6000:4819:b0:4a3:a0f:ecf0 with SMTP id ffacd0b85a97d-4abb9edc730mr12561602f8f.55.1795307334916;
        Sat, 21 Nov 2026 16:28:54 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm14415962f8f.31.2026.11.21.16.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:28:54 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: Ronak Doshi <ronak.doshi@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: netdev@vger.kernel.org,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net 0/2] vmxnet3: fix native XDP crash on oversized frames and XDP loss on reset
Date: Sun, 22 Nov 2026 03:28:45 +0300
Message-ID: <20261122002847.616-1-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
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

Two bugs in native XDP mode of vmxnet3. The first lets a single frame
from any host on the same L2 segment crash the guest; the second makes
the driver silently stop running XDP after any device reset and leaks
the program reference.

Patch 1: a frame that does not fit in one XDP rx buffer (sop without
eop) reaches the skb path, which takes the page_pool page for an skb:
kernel BUG in skb_put(). With MTU 1500 and an XDP program attached, a
single untagged frame of 1523..1526 bytes is enough.

Patch 2: vmxnet3_rq_cleanup_all() clears xdp_bpf_prog on every quiesce
(MTU change, down/up, ring resize, reset). XDP stops being called while
the program is still reported as attached, and it is never released.

Reproduced with stock modules on Debian kernels 6.12.113, 6.12.117 and
7.2.12 (7.2.12 untainted), VMware virtual hardware version 20. Both
code paths are unchanged in mainline as of e572847ee4d0. A small
reproducer (raw frame sender and an XDP_PASS counter program) is
available on request.

Testing:
- The same changes, backported to 6.12.113, were tested on the same
  setup: frames of MTU + 23 and MTU + 30 (VLAN tagged) are dropped and
  counted in drop_total at MTU 1400 and 1500; frames up to MTU + 22
  still reach XDP; after an MTU change, down/up and an rx ring resize
  the same program keeps running; MTU 9000 is refused while XDP is
  attached; after detach the program is freed. A stream of 5000
  oversized frames mixed with 5000 normal ones gave exactly 5000 XDP
  passes and 5000 drops, with no kernel warnings. That test module also
  carried a separate change to NAPI budget accounting for non-PASS XDP
  verdicts, which will be sent on its own.
- On mainline the patches apply to e572847ee4d0 and vmxnet3_drv.c
  builds with W=1 without warnings; they were not run-tested on a
  mainline kernel.

Known limit not addressed here: with an MTU between about 3051 and
VMXNET3_XDP_MAX_MTU, normal frames already need more than one buffer,
and with this series they are dropped instead of crashing.

The problems were found and analysed, and the patches drafted, with
the help of an AI coding assistant; reproduction and testing were run
on the reporter's lab systems.

REPORTER NAME (2):
  vmxnet3: drop XDP frames that do not fit in one rx buffer
  vmxnet3: keep the XDP program across device resets

 drivers/net/vmxnet3/vmxnet3_drv.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

-- 
2.47.3

