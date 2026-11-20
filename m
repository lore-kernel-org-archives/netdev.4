Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211119;
	b=Ty6XFnT5rUrKGM3sBmnPvDP2vIdSIkfXWTQLJMLcowptCWzWjKy98QPrX8rg8ZKeKOgp
	 8/Ga9EGbiksRsOXybmnM8zwbxaduBo0YpReuhdPkOG131A7G79wetT1f6BvkuhC5vWeCP
	 bJ+O1SEf7UKYm4gS68VGW5XdwEgXyIbaGv4eQUls1eAuMoEhx/lfPPkWuoXOUJtgZdoiK
	 98MGYj+IOSNq3K8KVlo3Hsi0i6y4oB87iglMAP7YMFzTlurJ661y251QTilBAXCDMU83J
	 zyt5PapCeQ6PkjCakt8MCE1uZUt/pGMKK0L1h3v/tOC3UkEj7YifhfExRdki+wuECBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LQYysgp//9KShYReg1WCF+KgYK2YJRDdVhocAyIlPg4=;
	b=enyb+rsgjbWP/Zmv9xHhxXYfXD0+wDJ55WHkfUQSbJpdTf+5T4gR/l/EDOEmICmREemx
	 I9/c6K4Bmq64ws3HKVN36oLaNMxXMBN2jZw9diShcmrXH8xJ+2fP3mAM3voX8TKYDC8VP
	 zbbg00H0F1UfdUvAsUSHJFwOKfb3WIlgENfx5VfCUxQmLgY0b/Emm4FP9sCZQZFeDpmrp
	 ZyqvryuGzU3hZny2O3RpSPKnnIDh+oKH3iy2TXwbuBW589TSt4QoNqMQJaX/ZIh7JmAVH
	 36pdUq5i6JnxpfKvxoRZVHX37n6Og09ogdfUfvMgpU9UjcypWUF793LmJAVxGtNJUZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=C2jpFfSu;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897ED606A6B8
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897ED606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=C2jpFfSu
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49429181ce9so891191fac.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795211116; x=1795815916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQYysgp//9KShYReg1WCF+KgYK2YJRDdVhocAyIlPg4=;
        b=C2jpFfSuutuCZeuGrrbB6CPrXuCLHPjsYbHeZ0INc6l3v8QadfuYXncjt5KuVqhCt7
         3SGz83K3k0XfOMALHygvAHc0p1IU97YYD7qpD97CXDb1KaWyKI9wQnFAKN+YjHjDDrKi
         mrAFEuwoV4wVp4oMYecBLnGPaSrvpuSnn1QWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211116; x=1795815916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQYysgp//9KShYReg1WCF+KgYK2YJRDdVhocAyIlPg4=;
        b=gIC0CHgvcHaBN0GxNu66WL5X0QiekbHm29rCh7HoiNj13oLj2QhMAgQbR9HU9a75Fp
         H0Vzg3IUYyPjuvPKkU4VXWe8662pAUtDM8PcAd0w4gjMluXFkANpeawTON3q9Xw31yDw
         y2FNutz1cV957mwd4RnlCKJUUQMiMVJIXK+7ZYG//9D312/2z8jD6rXC1eJwcP4EWbkS
         K7okPcd/uvrRu2gLG6Kq8gJ7NIQH4LhQm5J3wAj2DpUSTcU+Gcbayvw61C4G6gmdx1rc
         O6HBlItFftPnlFe06p46LGRC2V3pwjUV9SJb9ncbXjGgBEmPp52VptVUjMPfdrsCbfCH
         tC7Q==
X-Forwarded-Encrypted: i=1; AL+hErGwW9RtvfOz/joSrcwMVNLMa3rGMBzmVviz61Fp01EPjUWTxpayek95llTykUItTRNxm7TDD/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JaSkqaG3PRLWh6JRYMqi3F3BG4bjct9FrxQ09GwtHDK4no66K
	vozKQamPlyAPfDzEAd0eMN9RBoXSo8X2DZ2TkwrnFY/isRxdidGE9SpvqHzvQPC2mOU=
X-Gm-Gg: AYBFou22zmeKdjHOLbby9UMC+HdecuU5KvCRtAqtXs2GPciztihIyovrP618fBd8tgN
	kSj35yZ1wSZyoxMR+kbYir2Puu4hpgIaRiMzh1WZPfaUkgkvQrbCUUWlMVjWgLrLnz2PA4c1jpV
	wE4xdTIoT+uq6lMNDKSD8T48PfSGCfTQiFLuulVkZLVbyU7j0Chnr9tNr9xr328/9sogMRborMF
	LwQmteaYR0WivOqj/r37C460mYjxsTBvRpZeN/gWiPacQzZtgnFjOOapx6uWfUpoB7VPA3cG4cT
	5o6fgUFAzxkemeEYhHsG/UPP4fw9QlB2UA/8DMkKGsXW0IILJKN28GGhrNhza8wko387/gG6d6f
	wWimtzB64XjdUtBTYxKQDoUnaAHRYTS0j11LZHjEeB6ESBfqizHBHjSxPS5Hams1AXCMmTdZCjg
	r9nPdYGGMYPvc7va3js8mzDdJkPe8hsDaiSTDiAvHfh5p2kV9IAwQYa0RKInql0fgICTEVAb2IF
	eu4eOuV27PYhsS48PoCDChE0JzoxgjMGnnNS0jUtJAzS7WWLWcF1Kchygg/mhVPTHaJbyh0c2A6
	5kckw6SUuSSs9rYq3iDM+CDfoL+9qhNhoL4YO/R41QP2Oy+kFnYBzNeqssAub2oY2CfpTMiJA+X
	UWyWpTzYyPbCQTGNOnSSK8VlFfgg+Dum3qmvlaEDpcGbEGWqMJCE=
X-Received: by 2002:a05:6808:308d:b0:557:308a:9e9a with SMTP id 5614622812f47-57a095037bemr5687975b6e.21.1795211116347;
        Fri, 20 Nov 2026 13:45:16 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35c5ac5dsm3222237b6e.15.2026.11.20.13.45.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:45:16 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: bpf@vger.kernel.org
Cc: john.fastabend@gmail.com,
	jakub@cloudflare.com,
	jiayuan.chen@linux.dev,
	netdev@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH bpf v2] net: skmsg: fix copy cursor when coalescing clones
Date: Fri, 20 Nov 2026 13:45:11 -0800
Message-ID: <20261120214511.25934-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

A splice or zero-copy append can leave the destination copy cursor at
sg.end. If sk_msg_clone() subsequently coalesces with the last entry,
sg.end does not advance and the cursor still points at an unused slot.
sk_msg_memcopy_from_iter() can then walk around the ring and write into
older entries, including file pages spliced from a read-only descriptor.

Software TLS can reach this with an ordinary MSG_MORE send after a file
splice and a splice from another TCP socket. Both TCP and the TLS
encrypted-message allocation can use the sending task's page fragment,
so the TCP-sourced plaintext can be contiguous with the next cloned
encrypted-message range.

When coalescing with an exhausted destination, move the copy cursor to
the tail and set copybreak to its old length before extending it. Find
the actual tail on each iteration using the ring iterator, including
when end wraps to zero. Leave an existing copy cursor unchanged and
preserve the normal coalescing, reference counting, and memory charging.

The issue was found by an LLM.

Fixes: fda497e5f5b8 ("Optimize sk_msg_clone() by data merge to end dst sg entry")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v2:
- Rebase onto the BPF fixes tree; no code changes.

v1: https://lore.kernel.org/bpf/20261030042138.73739-1-kylebot@openai.com/

I have a reproducer for this issue and can share via DM

 net/core/skmsg.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 8a3b8536c0c2..f47c59ba1ec6 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -103,16 +103,26 @@ int sk_msg_clone(struct sock *sk, struct sk_msg *dst, struct sk_msg *src,
 	}
 
 	while (len) {
+		int last = dst->sg.end;
+
 		sge_len = sge->length - off;
 		if (sge_len > len)
 			sge_len = len;
 
-		if (dst->sg.end)
-			sgd = sk_msg_elem(dst, dst->sg.end - 1);
+		sgd = NULL;
+		if (dst->sg.size) {
+			sk_msg_iter_var_prev(last);
+			sgd = sk_msg_elem(dst, last);
+		}
 
 		if (sgd &&
 		    (sg_page(sge) == sg_page(sgd)) &&
 		    (sg_virt(sge) + off == sg_virt(sgd) + sgd->length)) {
+			/* Start copying at the newly cloned suffix. */
+			if (dst->sg.curr == dst->sg.end) {
+				dst->sg.curr = last;
+				dst->sg.copybreak = sgd->length;
+			}
 			sgd->length += sge_len;
 			dst->sg.size += sge_len;
 		} else if (!sk_msg_full(dst)) {

base-commit: d5ba86298b45e1a81c578c499e9a222a3b734d5d
-- 
2.55.0.openai.911.g06873a30d2f3

