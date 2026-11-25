Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593201;
	b=iByWd5y0dbqKCWLaA+cnGF4LjS489THVG8LtSRcXzeJD+XBxyMS1itCRHoP47R5MwnBN
	 gvs1ajo2/YuMxa4ubORzB3xwpHeU9Pf8jY+eKi2LxwHXZfxZlx8tlq77E8wjBlak/PxRQ
	 7Kx/iNcV0jKrZlh6W+BJxG4rXg8ef2vHBGCMiC4ppDAmArv5SLpV6f32lfDRWVSTx03fx
	 8nECTkIaUVDt2pNR8U210MKAAqc+efQk+2pi7/tPS2UULxAacO+UWHPu1JwP1Ezz6i9KS
	 80vX1xwPVyMKDG9739gd0hJT5LkIIOKiHDVkHuKtLicaLaGp2PjqiUZ7/IbSQMhhxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CGefND4gzGTszWXRJgmWXMeV4b965wnEKkDAEyQnj58=;
	b=UX8fJTwAOy5lLwlHH5ZyFo3fL1+/LUJ1/xQTobmvvGW/p3ucuzqoqhfmlDFQbDFhzNEH
	 ADJpJZsJn3OFgSBOHKaZ18pZoAmQuZo3jE/Jk0PvmZz7UZeXv/NqG41OslPuwjRO0MJ7H
	 g6wq9pMFKsYHfdjCqb2tpEdVw0dH6B+9tZqLkQstxyuXlfQIM5sJlt5RYSHY21XUqNxXQ
	 guoe5HUDLZYXCE/sFz0I2kVOJKtV3htEE8RKhMwMQYa7TLmv6Du2OZ0N0nL0XxJv2vh59
	 GKa6W5WipoBitheqF7QEDY1epUxseLJpW0+EIGI1oH0oFqDJqFANQdsHYPSaJXqTEXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r9Pz/jTv";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160FF606A330
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160FF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9Pz/jTv
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3812305f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593199; x=1796197999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGefND4gzGTszWXRJgmWXMeV4b965wnEKkDAEyQnj58=;
        b=r9Pz/jTvu8nlaajttnts3gXhr3rmwU8DPLsLhMj+ZbhCTIdvsA1/zMkJhnnUR/pemd
         Isxmrixd//XcHlSLSRzcXNyBI3DBPLIWc68W8he6Qf/OB9sygbWlgUgUeeITxqbRdTar
         qdQZdXeX+xLIRU9dQ7qpVmUDaDbGu5nf4n2LSIl9xjpc2MRM4apyMWj/T1FLYSltzPXT
         TufFGBuZ0H1b7Ng+PGR8HB0ihRVr5j5BGTSSXk8NtlMEOr72cE+DbUqvgUO8rxn9Izlj
         l/cdVaxrvpSmzaNdqUuctDMKA6ifuUO79V5t/CqIesqvOQNfZm/1cSA07yjRQ+JU/Mlx
         1iKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593199; x=1796197999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGefND4gzGTszWXRJgmWXMeV4b965wnEKkDAEyQnj58=;
        b=iXbqrp25OrZy+8Aqral9F+HHLJLD7+Yh314y/dl0H+Cvkc0yNC80fSrTbi6EOGTnLA
         x8LcP/X+i6J9hHYIeHB4FzTAvyLiBzbt49RQcuXc58MlOAllAQb3sVa9uqySmKetm/N2
         vkc1ufODPN3yOl2sXqw9aNshgkC1RJpHTo0WozO4ZnIa+pJLwrSXguxtVnJ2CZ5vUOt9
         0PWYkFpxaejGV8EvP92W44UlwfLd52PbdvvWyqtk2L7WK96jTl/DRgJtmRA33P2sfQeQ
         Jls8+XaKEbJyBaeNODRbCpBhWBQaiT2dV2rWtB6VsQIfatkYO5odPzGRCvPBl/9Itmec
         H3lw==
X-Gm-Message-State: APuU4Z85KVUIYPDWUw0fvDlCvBm2Ut0iWmoNYE7BKZ21iO99G+GztTgD
	yxBdN8VY0tjuuGJimyJvd+kXoFeOu4UGyCLbG7KiQZsNBD9L6S/nz0kj
X-Gm-Gg: AZFdTZd2dqe0ao5YkVgIw0k/Q6EXtshh/zaYIhfYc6nb+qPS2rl/rCPM4HbXLFsoeHa
	f3HEwTo2jZdaOWULRxhQFvODK+uAu0jKF+np/CuOLI0yFqFtqcldTp6nc7TJfZRHBLbQ4Y68qvO
	SqerZP2U4IkBLFUajs3/kdUOAnaDzdSBuXnWtq0HI9gjVYrMY9w/2Xl3TYQDjXJY6FDcazc2ksg
	jZoXibrnHXvUFrHnJjTaegmJq3xYy+MNR4ZEUKKG+wZ5vRphbVMIw95jqqLos4s6BHP/yAj1Gzm
	yxlQPi/Ch3/YzPyE/NffBrpkOKCaTCypH+rX0J4/sdGk4NNADyfPMDmp7J8spi++gW5+2Z2cROx
	14oigtwMMS+mMTcpc4oGEWGAfD1rdKnxsgXJlD8lG/2iriR0Ww4j3bDwpnGRu+eQ/6Ifs+Y4nDG
	kNt3IuFzLywkQFdU+fnLTrZCySkZV2Jj2W7miTPGAyKkI2qVYwR4b9HBkBVLmEmOdnykBYcWqB5
	Sv00mQgiv3+ix5t3xLklY3U+1LsKxYKqXteqX7/5ecaCOEHOWWZZ+vQNtRfc9bYDFQFkMOJHZYc
	8k6PaI9Aboc58rwbU7Uc/QOUFJhLcmU6tmUUUd0=
X-Received: by 2002:a5d:5888:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4abb55183b4mr32368217f8f.56.1795593199308;
        Tue, 24 Nov 2026 23:53:19 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33001138f8f.28.2026.11.24.23.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:53:19 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v3 5/5] vmxnet3: keep the XDP program across device resets
Date: Wed, 25 Nov 2026 10:52:55 +0300
Message-ID: <20261125075255.1517-6-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261125075255.1517-1-filzador@gmail.com>
References: <20261125075255.1517-1-filzador@gmail.com>
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

vmxnet3_rq_cleanup_all() clears adapter->xdp_bpf_prog. It is called
from vmxnet3_quiesce_dev(), so on every MTU change, down/up, ring
resize, reset work and resume. After that the driver no longer runs
XDP, while the core still reports the program as attached, and the
driver's reference to the program is never dropped: a later detach
finds xdp_bpf_prog already NULL and returns early.

Seen on 6.12.117 and 7.2.12: after "ip link set dev X mtu 1400",
"ip link set dev X down; ip link set dev X up" or
"ethtool -G X rx 512", the attached program is no longer called, and
each detached program stays loaded.

Do not clear the pointer there. The program is exchanged and released
by vmxnet3_xdp_set(), which also runs when the device is unregistered,
and which since an earlier patch of this series leaves the driver and
the core in agreement on failure. Rx rings are then recreated in XDP
mode after a reset, as vmxnet3_xdp_enabled() stays true.

Since the program now survives an MTU change, reject an MTU above
VMXNET3_XDP_MAX_MTU while XDP is attached, as vmxnet3_xdp_set()
already refuses to attach a program at such an MTU.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reproduced and tested on the
reporter's lab systems as described in the cover letter.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index 234897a..bc56b0f 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -2111,7 +2111,6 @@ vmxnet3_rq_cleanup_all(struct vmxnet3_adapter *adapter)
 
 	for (i = 0; i < adapter->num_rx_queues; i++)
 		vmxnet3_rq_cleanup(&adapter->rx_queue[i], adapter);
-	rcu_assign_pointer(adapter->xdp_bpf_prog, NULL);
 }
 
 
@@ -3670,6 +3669,11 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 	struct vmxnet3_adapter *adapter = netdev_priv(netdev);
 	int err = 0;
 
+	if (vmxnet3_xdp_enabled(adapter) && new_mtu > VMXNET3_XDP_MAX_MTU) {
+		netdev_err(netdev, "MTU %d too large for XDP\n", new_mtu);
+		return -EINVAL;
+	}
+
 	/*
 	 * Reset_work may be in the middle of resetting the device, wait for its
 	 * completion.
-- 
2.47.3

