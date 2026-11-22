Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307342;
	b=pbj/qPwN2Ji+E+JGgFEfK7gz9phBX/DuN5pAFbRfKnmJDFjhZa3WZX9kWmnoCdOuy7AS
	 1gnHBGdOBOGguS6CBjaaRBxCOCz+jCPzlvG33gB5KAwE8evf/E/deSi6e1lNsY+KxFpyk
	 qaXGYV7qne1VF/esyIhiT/QZ9xYuEdgbGlCFxvjImpapwfF5U1a8f7JSbJlLAtJu5cTJW
	 RfjYuwkY8Pk6ynn/mjtKeJRKXrAsKaJnX/pZAxuMQoex13vIr/Z6PEYGFqpazLqd+n7jJ
	 lJNsKEEaC4VFFje2ZmSod1MBuK0+vpmN7k9sET33Y8w6TgNuiHzBMM98t08FuPG8cyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/G8cC/pM5VjvRhgMXJMZVgVOoW4lbOvXOfP2V18I4BA=;
	b=Cf5mULbN3QsBi7PE3RN9CrminV8ocSsRbKNQtsp6XqTWeMkRETDTfPMBDYzEiQ1Aqxks
	 ZgrwtqkLxQwgU+HAjH5IeiYboRmtbcAwDK7DvlmrJeaDDSw++N/fol+wQ33H7/qxOqGyc
	 f/bGuLtRW0HV4/w7EiwlABmjbjNOv8FzVGcIgX7O18x1TY1C/weE8G1WrYQFJQyLfYTxu
	 u5q47Z2Qb3TijtKM9TMzhETsDHiy1hI4kbZBv/0p6XxsI9JLYFeGmbCtt0frVY+epi8WL
	 a5vfY7uK/TztAPOi+birwqMigo3D3x/+sp9IzKntVHUL6RQksLA/Hnr2MgLcA43qoGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUTVRPsG;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2E606A336
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F2E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUTVRPsG
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1118742f8f.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 16:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307340; x=1795912140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G8cC/pM5VjvRhgMXJMZVgVOoW4lbOvXOfP2V18I4BA=;
        b=yUTVRPsGn+svTDU9LnrNpZxovx2T/bDLx9rNuPeEfrA7Bys1MJC0dWAUytaphTT7aU
         BKX3k3L+6K7pm4xlT30vdWtuvTHM7sGnkVwrrGxyhCxdczi1KG/ZXj3zSbRcmpsFraE7
         /fXrEikEaKc03+6A5jb4QuIUfPnfZ6xkvJATm2S1Z+2MtHq2VSzsC2AZnt6DWCNUQc2b
         38lOc7QQT33emlT3U2nNfakHpyBll4kvmd9DGUfOkuG7HZLZ4m2Fr8UqC0HFEztQQOD+
         hLgIhUvMIbD6Nc1eXLM277NhCcfoM0euYspuYGbsLtJ1OY4UjVwz3+03Pjt9XMNPXJ9R
         TXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307340; x=1795912140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/G8cC/pM5VjvRhgMXJMZVgVOoW4lbOvXOfP2V18I4BA=;
        b=jUT23bCG/5MH4rzE1+XzbPV5Juw8lb2wgLft+mqR8R28af8xKnWWNo6xra4CINAfnO
         kjlxj3Psya5A9R3y/XKsVcQmwOwV1imXk5nveHfP22tdWv9wKB/RnK3tGdZSsXwCYOCx
         S1785uLmps9i8oy5WY1nSYGVzzSmMfptjU8nTDN4wt1YIuBE4pNVYR1rSw5f+kjuce5I
         +jEtb51BLQRsNG6fYno/IWmyIyElNNZBIGZoeR3xh0znXN3VpceMF4imzM5C8ql4OU1+
         aAg5wL5uZCkfESqRHM00PiIfzhINGWalFkLfXmAhYM5VBe4l8MjmHSH6ngua9boJTdN1
         yn1A==
X-Gm-Message-State: APuU4Z+rJrzZrIb3vigU6xqJb43BEAtVjTUxSKWQRRRtsp9aiY3hg6/v
	JtclgBez96B0PayXY9+BHjPjNq9nLN87NK5SM1hQ7HAJCK7I238sZSet
X-Gm-Gg: AZFdTZdc6oLv4uKBryENBdSZ7BT0KvqUf8EjC+sOdUq341mxHWOIBAZRK3EczpuhlOt
	fAf7cqyzrVejJSDIErWXTl/d1ZnqE1+wTMc7ikbCMIdszYuoE+PTpIds3pT35c1bNF7cC5WggpJ
	aoxPGMyhCpm1q0Twr6jkbgkV1bJFeLELG4QxRJBD3XG0qt1Qe4iU2MofVyQccnhrvlHAiuA6K8C
	vXEbBsIK5Zeld7SjNQOEeLvktzV6YJXN6zHbfUWnnxmE7k3Mgt+k2ga8Azwr41CMylU55nBkH6Z
	YLv0ecHqgWLnfnFt3OtOqm2k9jGeiR1gY+TmHJ7ommUtzBB+5jhhgRtq7YMwbhTcZe2Z78Rx4q9
	PModTBd6Vb6DcpI9K0W9EYnolYJRy+LvLwF+XrZWRZpiwaE7BMd9oRJ8QtOJWWG3MkWThmXMYqm
	uNMBqhMlyxEW/PqYqxj0peAlN+KgzBiRepib7FDdWEX+acB2QB6W/48mL2rO11IecrbFFCYLTGu
	y2ZswHhlGWBZEUoIfirofP6k+RsFxtkDkaFG8x50KsbdTPJRQ/WnmAKHG0Svmpc2+YIygQM0mUm
	b8TAogHFljH7bQHPhTFKhLPY1Y/jB+9TPIQ8j9Q=
X-Received: by 2002:a05:6000:2309:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4abb0f3bc89mr16198391f8f.16.1795307339892;
        Sat, 21 Nov 2026 16:28:59 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm14415962f8f.31.2026.11.21.16.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:28:59 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: Ronak Doshi <ronak.doshi@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: netdev@vger.kernel.org,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net 2/2] vmxnet3: keep the XDP program across device resets
Date: Sun, 22 Nov 2026 03:28:47 +0300
Message-ID: <20261122002847.616-3-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261122002847.616-1-filzador@gmail.com>
References: <20261122002847.616-1-filzador@gmail.com>
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
by vmxnet3_xdp_set(), which also runs when the device is unregistered.
Rx rings are then recreated in XDP mode after a reset, as
vmxnet3_xdp_enabled() stays true.

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
index fb98eb7..e84bf11 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -2104,7 +2104,6 @@ vmxnet3_rq_cleanup_all(struct vmxnet3_adapter *adapter)
 
 	for (i = 0; i < adapter->num_rx_queues; i++)
 		vmxnet3_rq_cleanup(&adapter->rx_queue[i], adapter);
-	rcu_assign_pointer(adapter->xdp_bpf_prog, NULL);
 }
 
 
@@ -3663,6 +3662,11 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
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

