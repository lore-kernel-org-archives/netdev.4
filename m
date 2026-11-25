Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575274;
	b=qdRZAqf8G+BOSeIQetlH6KZgPUphKAz7QDMPoSUJbNz3vS60Xzrpu3SatROVDKpfAjva
	 gV/oXGnwemo0t+OuNnjuFRV1z6TJUGFJyTRVKLA1Xtv/5J+Yc2j3NpI2hlHJN9BG5ob+Q
	 1xMZJmo0PcPnQQJ3ssSJte9bAeYu6nAv7QX+PQNah7IaTvvm/6F7N4H/XmPTT+0hjzAwW
	 DzATCpRiquYcxTfcgmqeFpW9Zt7JeLMU5zvolFT3Lm4hS6PfaqKDKC+BMY8ZpJ+ZEmzWq
	 7hrPol4iBWppGyk0kSEGeuXjlqnltf6WBBegG7iqDSLcvFqcolHzG92VXzUjipkZcOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nYcqetcvLyvB4381YfPzaUfE0Uw7XSF5cfIm2f1E+Ec=;
	b=QLyMICVG2r5bYywOvxFgY014vtxH4ixgWgpL1uCuax4cPkRyYLiSO2lzlDr3M8tRnWTg
	 4MMFJwV3f+DUYdHEWi2f042V7wiqQbyXzd6LicksyjS9PcBkbXHAOeLp5xEDydcfI5jof
	 Jl0czR1i84KCVsU8o41UxfnNCuzvxDA2zwn735CnRcqYlyMi75YoeBvAwfpKXkdjjf6lI
	 kBaCq0Tm93NGxelZbyhe3vgS40GMtZU4ZhyE301efDsUC1tldJXB9Kuu82mfrzaACmoce
	 r7X+MbiB7t5/+CrpS67s6LFDeoPGi4JuvnXAPPH+POnSHm/NRBZqGNPKoLX7HustUjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcmllzgS;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9D606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D9D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcmllzgS
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so2490942b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575273; x=1796180073; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nYcqetcvLyvB4381YfPzaUfE0Uw7XSF5cfIm2f1E+Ec=;
        b=WcmllzgSo594vVOxFhLaPKOL9Dx8MSMDfNnWzXxHEh//uKVblCF9bXBPTrI5b3DW/F
         U+1gxp9oXGFkVAibd0ZKt/z9f5SmY4mOsU1un7Udcj8PWBX5nn5iLF7BcmwNyzgYYhhu
         iMzVT66o7ZJ9FGHIN8ZTTGSvi9ceWVOq/KRwQix95abUbaqnZUWBuSZnKn8wYsF/5vaw
         /wZUehFROQ47GFulqddvvc9kTr8krQ/xuYIeN8FutQjm/OxFgLz1ckyWCWSXjD4gX0Ra
         s4xJWBnbWySGIMp6woSXCwcER/80emOiKLcnu1sTEM3uDu6w5BKDWcFgUi6hUYfVM2ln
         L/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575273; x=1796180073;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nYcqetcvLyvB4381YfPzaUfE0Uw7XSF5cfIm2f1E+Ec=;
        b=dN1X9gYdglWinoRRFvLbbRYJq8bb0ntrsHIZljivnT0+D9g27Crsnhd65jiVH1gJ9l
         ocqCf+cBxcLrN+Pc7rkj8niX4+XIsOD/OdkZtqkrE8fHnlXY8KdnnH/9yn81taoTjukw
         ouUKbEE/jmgVM+f/DiSbmoJkW5/OqqAOm3YjTZ/9kXwjml6zLY5XHrPD1XA9/e/nOCm2
         eBIU8Zou2VxPJ+JgJFXNXwsyuvEPjYJiLRttR/mmiSH32yuLFcFKHJRooG+OuTQ22+DY
         ZMOJ2Txw0PHyegaf57Dm4Jbk6LPRgPpC9Di3aved7W0Ze2kJx8omtbgRq03uWSJ+rMuh
         brGA==
X-Gm-Message-State: APuU4Z9+sulc76RCoewxduYbniMtrpZgpy0FBDGwZWAHaqlyRz9pst2H
	3eqz2ifkl0EC2aidVfJaw1hrGPKYAxJoEaMZw+o4SlOgAFbeu2MZWiHi
X-Gm-Gg: AZFdTZfJjiGBIaHFegj6yzkUYwczEQp8EdddVirAPMYYsgcgafIZGwIWEEDX6E3y60o
	U2ZkMjr3AlYP0I2dbN/lY+e0j5tKQFlqTbzxnUHyJIAaX/XW71eY+yKcDBgWbTijgNSyN7Puz6s
	PfzRoG1fTK6P2dOnLY3AkOIHEczDrzUuTKTstXedNGPjxbbvBwuqDlpoil5oFaapNLsH8xoExsR
	tEIYWCdqm7tSiNsz+OUrqcstaWij9Z2/A9vzexcEJnDBQ2pAo+WQGN6JkdZ8IPHoULlSL1Bus06
	1oe1STKzMmxLFwYmKE85C6wqgCZOA51TxMk2Px+KlwjHPjt44m26/FvfHS8QHBM+uDQNBhI0F6i
	qdrnlfrr4h76Axje5+7mEcdZ0Q8lwsiIfZJtjI2MK4vSsEEKmCYXCCzRNTT9jdV725AdVDPvlZw
	58DAhmrIW0in7trokVACvstf8m+L/1bPhtPrl3xbvLCccPgUk3dsJP707Yvg44wFpHVpECyYImk
	H32rB07eGsXOOTQTQC6QhskAeMizzHONlYenIOJt49xvs3UQO4+R6RFlUhsYkCYcSvlGOrFIvNw
	EIMKpFSI0IA4HRxyomNW7NBD1zS8UBlA+vvnCIYtsDbP7+cvn3pxxpMVefzk18G4lK2PD8O7bA9
	XccQB9VsqgXsTfZJqpyXuOIxyv6jAV3vY1sOsritdasFBmXrdvP+itOuE
X-Received: by 2002:a05:6a00:27a2:b0:8bc:686a:a54b with SMTP id d2e1a72fcca58-8c87daf2a2amr14141063b3a.56.1795575272929;
        Tue, 24 Nov 2026 18:54:32 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm8118228b3a.28.2026.11.24.18.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:54:32 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Wed, 25 Nov 2026 11:54:19 +0900
Subject: [PATCH net] net: re-notify tx_queue_len after rolling back a
 failed change
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-tc1-txqlen-renotify-v1-1-6c8e9c4d0503@gmail.com>
X-B4-Tracking: v=1; b=H4sIANpNBmsC/yWM0Q6CMAwAf4X02SasAib+ivHBjQ5qTNGtGgjh3
 53yeJfcrZA5CWc4Vysk/kiWSQu4QwVhvOnAKH1hoJo656hBCw5tfj1YMbFOJnHBU+xa8v2RYu2
 hlM/EUeb/9QLKBtdd5re/c7DfD7btC7tugPF8AAAA
X-Change-ID: 20261124-tc1-txqlen-renotify-7f652bd32f0b
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
 John Fastabend <john.fastabend@gmail.com>
Cc: netdev@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

If a NETDEV_CHANGE_TX_QUEUE_LEN notifier or the qdisc resize fails, the
old tx_queue_len is restored, but notifiers that already saw the new
one are not told. Notify them again and log if that fails, as
netif_change_name() does.

Discovered by a non-AI static analysis tool. The reproducer and the fix
were written with an AI coding assistant.

Reproduced on an unmodified kernel with error injection (failslab in
pfifo_fast_change_tx_queue_len()): "ip link set tun0 txqueuelen 100"
on a tun device with a pfifo_fast qdisc fails, yet the tun ring keeps
100 slots and the last RTM_NEWLINK reports 100, while tx_queue_len is
back to 500.

With this patch both are reverted. Selftests were not run.

Fixes: 08294a26e15d ("net: introduce NETDEV_CHANGE_TX_QUEUE_LEN")
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
netif_set_mtu_ext() does the same re-notify but ignores the result.
This follows netif_change_name(), which also logs a failed rollback.

I found this with a static analysis tool I am developing.

The reproducer and the fix were written with Claude Code (Claude Opus
5.5) from the analyzer report. I reviewed all of it and re-ran the
reproducer myself.
---
 net/core/dev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index cd0796a1dbfd..56c2bb08a53b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10196,7 +10196,7 @@ EXPORT_SYMBOL(netif_set_mtu);
 int netif_change_tx_queue_len(struct net_device *dev, unsigned long new_len)
 {
 	unsigned int orig_len = dev->tx_queue_len;
-	int res;
+	int res, err;
 
 	if (new_len > S16_MAX)
 		return -ERANGE;
@@ -10217,6 +10217,11 @@ int netif_change_tx_queue_len(struct net_device *dev, unsigned long new_len)
 err_rollback:
 	netdev_err(dev, "refused to change device tx_queue_len\n");
 	WRITE_ONCE(dev->tx_queue_len, orig_len);
+	/* Notify everyone again so that they have a chance to revert. */
+	err = call_netdevice_notifiers(NETDEV_CHANGE_TX_QUEUE_LEN, dev);
+	err = notifier_to_errno(err);
+	if (err)
+		netdev_err(dev, "tx_queue_len rollback failed: %d\n", err);
 	return res;
 }
 

---
base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
change-id: 20261124-tc1-txqlen-renotify-7f652bd32f0b

Best regards,
--  
SeungJong Ha <engineer.jjhama@gmail.com>

