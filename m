Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177457;
	b=PaxiTavlN8zPhHsUF+nCM/h9eJDduRUmzLdP3Rwul6Mccd9AmldIyeNh4BYizChMtw6V
	 xdNfInSU6p/xOAKESpLHl4uQKeXxHCa1A4sa4Nwc2R4WDFpzAG+zD8YXNN+FH0w+3hPv2
	 iR6BWfemh4stw3ZOatlYLmFSnpiGm8xaKkrSXGTp3iWaw1RYhBVkgugAFWWxx7znem+Ep
	 pihger1SoLRRASdPd9FBNIm7z8KcJmHp7Ajcq9943pzwM5fv2CX9qNqHikawXq1wz32Yr
	 8CH+JJqKCau1oMSBbKBh8/hdFUEsxfdzkpD07Z1G8hpwDMVAawpiJ1umeO0y3EwxWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LqrglXjR9ymHWw0kAJetzkcHEFdTagQt62oXIl2MFEg=;
	b=KxPNEeNJahCddRu7bFSGtrTasKCCpeZLrk4HI1sy4YyW5YvtLL8EJzhDWIvJsX8x1gHV
	 jg4JpAmJJ5ShUrolYFtLtVfYYkfaFWPDJ6eXJ6dR1sX8wPxXQl6VBr+O+Tcq0iecE3zD2
	 avJDZ5spMxZA4Mh/M/veMrnmqaoI3WwDAHmLwd6r7cu8lEaU3Svl5KyB88R+xoOEG3VqF
	 uicxnAJHEyvAvni0oBA+bGQ3pg2S7dMhK1XOnrUyITHJTont6yEg7w4ClUb5tFfN4Cxcu
	 lNAyydM9GiGdv/yG+pHuc0Tk7dmWp7P0kW8bp1X46LEs1Jql8ehiPZj11oaM6RmqeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFzYTlYD;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD3E606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD3E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFzYTlYD
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3712b6d9843so734689eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795177456; x=1795782256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqrglXjR9ymHWw0kAJetzkcHEFdTagQt62oXIl2MFEg=;
        b=SFzYTlYDX1OhDAmdlxUW7SfrO7KSNfKf6TpFkSQfb6uQnjWVJfGP4AbYS+2e9D/qIK
         Ui55E/zF0KW21/eQTYpzpku4mCOrNuC+h3vwNXsIILHSn6qyVMOYwXmWNvbTyfeFdWBA
         MqyEwInCWfb8uhXt7ZAvavgLumvhIwTpTWtS6ZbmH18pe6C/TYVIY8+tyR/EgdemZtOU
         WJkT3d/5ytAcPh4tbaJLtr2v4Ol9dakD+VE7ybFNTigLYUcSD/FzKsgoQJjv2zjLnCgl
         h/8XxwiqwF34W4sDkIVqAOW1MhgRdp+nyg54WShxpUsvIc2qzeFMUKtDIjc/yc3X0KZf
         RELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177456; x=1795782256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqrglXjR9ymHWw0kAJetzkcHEFdTagQt62oXIl2MFEg=;
        b=Fx8Dfk3RZnA4fTRu/fl2SOtP2hfDTZYaM5Sc0s8bEl4ExC4+CB/gLMC5OfoPbvpMEu
         DLMTiAb+KY+V8E4DgJ/5i0pTg+rnWb9r5cZ60rM7wMUBp7KEbicmmmhorYp8yhhcU4qX
         eJG75FqdCKqu9nbt6TKuZqWyNH6XFrepOBhgCEzRzg7Zk92CupQMZjIz8SPTwf2kYrt+
         X/C4SEY3dLyDDNkilCqOkRt4eJWt0t2/b5MXdIhhBEZJHkZeiRNUQLvfImeACnT8Nm/O
         KRicNvfAWjgIibSahtgMvuKKr0vEXcN61THr+GSrISZ+kk8ah/iJt6ZP8EHKU6jxRx8p
         1VJA==
X-Forwarded-Encrypted: i=1; AL+hErGL5Ne8TyaHmyx1osDHuMAVes5EnF/2CM7VQ8yENIpasnvXepdoacH4log9pTUt9vR2z/fC01Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rIK7G1QGtpSES6LirWx9ZwQf21PFIdwXiOV5IJBk1dp4VUNC9
	uzBTr6jfYJYIzHC0qJdpM/H0mRIxQ/5IZhNw8s5CIIIgb8NosliBbhGH
X-Gm-Gg: AZFdTZe2VBai1L4IC7vMho5aHfq9ID95EZPAkQ+ZQ5031Dx8Mll5aoKiVWwYjXxFug3
	BYOAFBnaeeIvlnDDlgqc3m+znLuBQEUd9vlC2s09BFIHuZFs709t7Gc7Lxj0Czrqk4hxynfc257
	AHGwC7KHTNGWEBCEL5+B4lCGVxjPWn7b8kqb884jFGQ59I933/5bE4hGxtdlr7LkNxGweULLevc
	KqMvdRJmQVwf/KCMCH5m9yEKCqvKnglFitUqOjATNXog97kgyKFIMyuPg9sv7AQPlbpRBJQFQTy
	b6cj1losWZxMqakgW/ln1InZxekYHcLTNDRGujgMISHltR/L4b5b65C4PBUwjzLi/bto8qg4zTD
	ATPTsuX9kC7lqlxhuqhSbBHcc5D3xOLNsw3uw34lXQZUC8A3lCkEPnvuGz+pqOIE/0rQ5rfUC0P
	ZjlY9cS68+/+3OLXIVOBJ6sJdj6ZXm8lz3md9cwte6jRg1VnyZP6MPBNC0pulLjcginjhsU/7UY
	YUz4JG6h3D/bj/8NdkzyJK/1zNNNWov035Q8Wsm8qOSBPgj4DaEviERmyeYb+bsZ3BRqDOhDXKQ
	JRWbvLYZO6VVANaxPoSFNbRRTRuN
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2519369eec.7.1795177456292;
        Fri, 20 Nov 2026 04:24:16 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:2204:d735:8fdb:7bc2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm9563591eec.10.2026.11.20.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:24:15 -0800 (PST)
From: mdshahid03@gmail.com
To: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] tcp: fix division by zero in tcp_cong_avoid_ai()
Date: Fri, 20 Nov 2026 17:53:48 +0530
Message-ID: <20261120122348.207708-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The tcp_cong_avoid_ai() function divides snd_cwnd_cnt by the
argument w without checking whether w is zero.

Since w is an unsigned value, the condition tp->snd_cwnd_cnt
>=w does not prevent division by zero when w is zero.

This function is also exposed as BPF kfunc, and the BPF
verifier does not enforce a nonzero value for this argunement

Return early when w is zero to avoid divison by zero.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 net/ipv4/tcp_cong.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index 8e83ef81fc18..f70f49b4b1e7 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -469,6 +469,9 @@ EXPORT_SYMBOL_GPL(tcp_slow_start);
  */
 __bpf_kfunc void tcp_cong_avoid_ai(struct tcp_sock *tp, u32 w, u32 acked)
 {
+	if (unlikely(!w))
+		return;
+
 	/* If credits accumulated at a higher w, apply them gently now. */
 	if (tp->snd_cwnd_cnt >= w) {
 		tp->snd_cwnd_cnt = 0;
-- 
2.43.0

