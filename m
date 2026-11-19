Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115629;
	b=rn9LIgQHrqUjkalarnm9FZQDvtLGKzUEtxKdbOY7pO6Ycd8nmAJI8WTqgvn4LOM8mrTc
	 DZaFm/Tk6OSz0OvXaKcJU5tEgjLf4gjLNNJDDk5+98GLvblzxu52DPGGgDdOPVwhT8aAC
	 j0zGqjD+MeD+YyGbRxIO03p7PIcBWwivV26k4rGSKoOS7ke3q8Zw+Fbrjsz/DWX898xAi
	 rCpFbhS+kd8MSON/7l8dZ+rJg8r8mRsMM5VJnw3ibvi/BJG5UBJ6B45qu1tECj3Oj/pzh
	 czvuw+OmAtLUDo5+8CjTK77sGXZiQZoJpAGR4g3rtw1GM/WZMMQDBSUvnkLM1fbu1ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a+z6mJhs1KktBn3M350sCCYk/JoB/kFHCxtw43qfBds=;
	b=QnEcFgrW+cwPoznS7IDZG7bEpeY5e1CMHD5MNfDYemGWYllTGEb3z4SSnYtZXxmAH9na
	 9PdRwZuFyb4YUDr1Ey1Huol/SvHoJSTmV530EoJcnGQGYn84JQGb9sD5fC1POuWyBo6Xr
	 YCuzMINnSblmzP3JUvxFBUOwgEof7UpbC6XYLiiWTpgCNw/xzAMg0H4RU/M6PRp7pQnpy
	 0cDo4UCfzzyQi6W2qpZCb0PRYZrfPykyhy8xVm20o7EI2WlShClZ4pyUgxmpvQxY7gPn4
	 veo5bW2qGhTZMTsmo8swoTlEgfxa5+4DmyGAHvz1OuTxrAHjNcfLBaTCvZIrQtOlKQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="LPAU7h/N";
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A69606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LPAU7h/N
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2f02f04a426so657185ad.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795115627; x=1795720427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+z6mJhs1KktBn3M350sCCYk/JoB/kFHCxtw43qfBds=;
        b=LPAU7h/NPvWjlamL7CWK7Ni5CA+OCh4Ka8ks9a/Jwh3TPHBoVDzEMh7J3ysHtHie39
         VKrCp6iJkHbYLdvtcGbIFwySuvCs4HAyKnUwFQzsKxKeObp3SEm4xocX2cGfeD8G81bu
         21A2zDYAfS33yn8CEAOI49vplUW/e4ZfPhH14Z5vke41ENWjjA65Tws0WHmoKdX8QEO+
         +UZOW3lV9hvpfJJsOUL9uJtk4rqYPVErWUDTROpMg4XTUDOEAITx91lY3bNZYgxBskRm
         Cbm14Y1z7N7h7ye4fX25yzkW9ugR6Win0RBCzN0HagINrIYI+J01uYR7a+h+5pEl6oAZ
         YjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115627; x=1795720427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+z6mJhs1KktBn3M350sCCYk/JoB/kFHCxtw43qfBds=;
        b=stVhU6EsaHbxADTaRViMKtJbj+a1faYGuGCBOVI50NnXhJ9AvQwfbEle3PsodKqyPn
         dygFlLDAwYwZJObCi+MdxSruvvdni9w0qY4V+OdRJHcvw07HV5JCpMbQ1brOjrbRq0QF
         caw+ErN4OqM1WShu1D6DKn6dds2sEM8hxgl1YGWWkkO8eakpcC1YCPm1LmuEHNsuM5zU
         ymW+OWh58awRdAgkdlDprq9etwtGWKlEV9TCtNdfxxWl4HNYF9RNmvadkAhCV6k1MA5b
         nnEiXJfFkxY0iolPR3b81L5OZc3t9u8TaR4CReTX+YGsl2od3yevXZmcEu3f3ZOt8dlU
         8CtA==
X-Gm-Message-State: APuU4Z/la2iBavm+wYRHlsczjSDx1/wiLMDynsLoxw6L6OWAraOV2aUq
	LzC2dow2LWapEG2MoI9LQA7mORWVPeeA9tc9ZoVzKzR+0JuAhHyfL2noh/OACszF1Y/gR/2a7+V
	irw2r6LWidDI53bWxJmowSw1dNSGCc63FSc0vblou+F+pEjrvJxJu
X-Gm-Gg: AZFdTZfZs9u2yEs/O0CLILgWejDq91VdSJ9qHWZQ+FyhkXo+cjank+DXlP86cwmKxX6
	qo5n5ePThv4mPKOco+zhvNdFGgQ4Ov8LBXnK72WvwCMOZb2GwRtZ+540+Beel3kRqe6CA/buO6V
	O0eaSPrUFb83OcEc93dQZsSIDVys80UoQuRfWU1s85YBSuzjp0AdOYAdgPUaLgYjHWdA946QPrN
	+0hJ9AHorAJJMX9hmgmYIYIgbkhRHgVr8k+7WFQxfKWJLFU5GMiMGve4TmI4iq7tk2wYO0WK4op
	jm+GzwKfWPlM8FZXD2KH23TNwr1MKqD37qkRE7tjzkev3kzlP2pDrjBYMWYjzEqOG2FOIyGBGji
	eKV+Xjl+GC7vgFl1dyXqB
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr293276a91.49.1795115627393;
        Thu, 19 Nov 2026 11:13:47 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm1541099a91.8.2026.11.19.11.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:13:47 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 7D863400FB;
	Thu, 19 Nov 2026 12:13:46 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 776B3DC1565; Thu, 19 Nov 2026 12:13:46 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alice Mikityanska <alice.kernel@fastmail.im>
Subject: [PATCH net v2 1/3] tls: device: keep tls_sw_fallback() from encrypting its own output
Date: Thu, 19 Nov 2026 12:13:37 -0700
Message-ID: <20261119191341.4089157-1-rjethwani@purestorage.com>
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

With a bond, each skb is validated at both the master and the slave.
tls_validate_xmit_skb() skips the master, but tls_validate_xmit_skb_sw(),
installed by tls_device_down(), runs tls_sw_fallback() both times. The
second pass re-encrypts the ciphertext with the same rcd_sn and IV,
cancelling the keystream and putting plaintext on the wire; for a
complete record it also computes a valid tag, so the peer accepts it.

Offload plaintext always has the decrypted bit set (tls_push_data() and
tls_device_write_space() send with MSG_SENDPAGE_DECRYPTED). Have
tls_sw_fallback() pass through skbs without it, and clear the bit in
complete_skb() so its output is not encrypted again.

This needs commit fc6d80eb5044 ("tcp: prevent collapsing skbs across
boundary in rtx queue"): otherwise a retransmit collapse can merge
offloaded data into a pre-offload skb with decrypted = 0, which would
now be sent in plaintext rather than dropped.

Tested over a single-slave mlx5 bond, bouncing the slave under an open
TLS 1.2 AES-GCM-128 socket.

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Cc: <stable@vger.kernel.org> # 5.13.x: fc6d80eb5044: tcp: prevent collapsing skbs across boundary in rtx queue
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_device_fallback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/tls/tls_device_fallback.c b/net/tls/tls_device_fallback.c
index b547027cc879..57d8f6b50e4d 100644
--- a/net/tls/tls_device_fallback.c
+++ b/net/tls/tls_device_fallback.c
@@ -192,6 +192,9 @@ static void complete_skb(struct sk_buff *nskb, struct sk_buff *skb, int headln)
 	skb->destructor = NULL;
 	skb->sk = NULL;
 
+	/* nskb is encrypted now */
+	nskb->decrypted = 0;
+
 	update_chksum(nskb, headln);
 
 	/* sock_efree means skb must gone through skb_orphan_partial() */
@@ -371,6 +374,10 @@ static struct sk_buff *tls_sw_fallback(struct sock *sk, struct sk_buff *skb)
 	s32 sync_size = 0;
 	u64 rcd_sn;
 
+	/* Already encrypted, e.g. by the bond master */
+	if (!skb_is_decrypted(skb))
+		return skb;
+
 	/* worst case is:
 	 * MAX_SKB_FRAGS in tls_record_info
 	 * MAX_SKB_FRAGS + 1 in SKB head and frags.
-- 
2.50.1

