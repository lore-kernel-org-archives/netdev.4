Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697770;
	b=TonkcjWqJH38tDRj6ipcDySIcu5OGflWY4Tuu1SazQLGuUUKZtE0cLF6+DQ5prXj5/nc
	 sN8i34L7QgwIKfR7p2w9asfslkl03Th0HmRGl+XQtstGyHnUxo4TIvViKvS5GHHdWG+e3
	 mmkYTmWxoAJzh7WdLChukU4X2pdmPS0ItmtbBWr1QSapMDexX7p+ehz//DqR5pr6V0Ak3
	 3nup2cy4qCET8RFLBYvpH6p5BUVa4pgMjFPEqcoSakzh5FRYX1QwFUCpqK43aOjiDGMPD
	 YbqqHq0n00QhyrZt7cOlE2ihR/tE0S0IFgCvQkUbidXNnvnbCEggB15wLiGD+p1S7PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YKEgczro7mhpR1jUufN4Btp76B+Ta+1rD47sqZvgiP4=;
	b=FpBnIGGAR7hFC/vTJQSxaZ4ssTnzg86HezJ2E2VLyHSiH4Ct7hdni/uCxkpAwgfv3WeJ
	 fTlGNdw+WvmalgixvAxmbAfAWtoLhhddgu1tnPPCX0fzx40YKh8mIppTopbVjsS6TlGJd
	 D489k+fY2H43Y8+um/niRFBurFJAxAqv5b1mkiqVtF4J2WgWEGy0EFsfjqZfUu2tDmGPE
	 Bn+xh6hOBx8ZqYRMsKeUnnuQhEk9eOx4kErDbog+o80i2Xlhr2dnhAx0D8dik6nbVnAdL
	 yqza246G/wau3ZFNwXJGcDuI1vySNXxhOVuGJ0M4Uv1msZFLp775UAchRoRDRfMJt+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O1pL0OGx;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE27606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE27606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O1pL0OGx
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso9409661c88.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697769; x=1796302569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKEgczro7mhpR1jUufN4Btp76B+Ta+1rD47sqZvgiP4=;
        b=O1pL0OGxdiTpl0rOlLPrW9gPsW4MnolnB78YVFXZt3taZLxujkSBcUBiQ3+4IZpmEC
         omovg2bBGRe3RYLhjNqmZnyo0uHQou48lPz68HisaUZ4pW5dC8kv++/Yb1ijKT+TVuCs
         M5/XId/v7wsoU9liz9H4XRh2Xn6iM72/1HqC+P0N7i44V2DuSOkxt1pDbe8be87fUm/5
         /fqXl5jPUxA/H2MdvfVl/C0R5LpCY/JQvjU9/tzKdjUte6ZydTPSW/CIHmwn/eb8LB+p
         bK5l8XtflTXwc0rHFSYzXBOVOIfxIGG/gOBeIBw9Z2OSi6aFuB9W2Hp7vB/8vtnoykoi
         hkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697769; x=1796302569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKEgczro7mhpR1jUufN4Btp76B+Ta+1rD47sqZvgiP4=;
        b=EcS6Bd707oLj3AXexsigi9+4kdTQUJ6uuKPs58dY3W2yzu4qMvYwKJfmv/fHNi94Ri
         ElKIXBvcYUI+xvpyNi7fvIigRfdSgfEscvH416kDR4ApheBz6g0f6OTEhfCYvh+r/14/
         kUgVqnE9XJsa5bUa5k5QWV7Ul3KRYMweB1nW92OJSeWGxJYRJE/VzPBzTOQjYkzINXtA
         0wMIDq8roiOGYTikoS8qjdTLyEguA+OTqN/eS+5TSxubhO7nZuzy4J5kdwZJY+r0rLHF
         Uo/sKHXOLKQZlGRiTu9MCzJOWqdxHcjLA9+1XUDdlyMHqeVhe8C+V+OC0zTJhsXTqyaT
         mF0w==
X-Gm-Message-State: APuU4Z+vn+4c1H/lQZ8q6DKTZhF9O+6x4JiORicGydVe3pYrNB5cKUEa
	958qD+Wf7lSXk1EtjEEkmaw13na4n9yEwm++ewxJ8anQ3kR2drWwseM1BqjaSA==
X-Gm-Gg: AZFdTZc7nul5212qMA8Zd/j+NrXPjiqqt+qT6Gc9r9+v3mXICA0SBumGUfD9QBlA20o
	S7m8NwFmMhnuYVRESwrPNddRLZReaBm1sHI9Jj1D5XAApdB7sRymWZQTQYv45HWt1CXqF3QV0eG
	z77okz5OJrWwtc5B7K6KU/UVapjkALk5Df3vDgDdqUxTcI668DxM7ghoAKqbORSb3LBRJ9yXjdE
	K/lFoJze4O93IVZchfoLa444XEwO5Ih0g7C5F3x98gI2AAw9S31x66k5lxmce92qSF869R9R6aK
	G+M2enhcyQR+kznC0nNsV9QiUADnkXmxLtqksCfw4kuAskrOZbdoQX7VQi51J0ehpw2H4/hyQHh
	PJG15S0cQH9pDovChTOPjqIKujRkGWOkQc0Tb/fFHQSIDGKLmlelM0w2WWyXx3pogekbCFR4Cgu
	JIIn/J36juvcC/xeJV3ux2pfXvPutwP7XsvRhR//2ABFNam1zVpZdb4+fD2DIZTOEAiuQJe4T8M
	8PpxxALnj9FvIvMNGGba4x15OErnuvEzywzMjOe9nl5J5WGzhW3O2aTyCblLPiN4f/1R6yhbuBC
	6lUV8wfuWzgXo16bAoULsZKl+llWzwdVUSHQk6NdsTTTCbqIqJS8jxJxKf0q4cUR4N0xFzYB6Sa
	XLOlSqhfGnA==
X-Received: by 2002:a05:701b:2096:10b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b5568eb642mr23363487c88.22.1795697768631;
        Thu, 26 Nov 2026 04:56:08 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm65219694eec.28.2026.11.26.04.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:56:08 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	tehnerd@tehnerd.com
Subject: [PATCH net] net: xdp: Fix skb->tail after bpf_xdp_adjust_tail() in generic mode
Date: Thu, 26 Nov 2026 12:55:56 +0000
Message-ID: <20261126125558.2032158-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

In generic XDP the program sees a frame starting at the MAC header,
mac_len bytes before skb->data. After bpf_xdp_adjust_tail(), skb->tail
is set to skb->data + (xdp->data_end - xdp->data), which is mac_len
bytes beyond the new end of the frame and can be beyond skb->end.
When a tc program then calls bpf_skb_change_tail(), __skb_grow()
compares the negative skb_tailroom() as unsigned and does not expand
the head, so zeroing the new bytes runs past the end of the buffer:

  BUG: KASAN: slab-out-of-bounds in bpf_skb_grow_rcsum+0x1cc/0x460
  Write of size 4096 at addr ffff888108e84ec0 by task xg/365
  Call Trace:
   bpf_skb_grow_rcsum+0x1cc/0x460
   bpf_skb_change_tail+0x50b/0x800
   bpf_prog_f9246b7887bf521b_tail+0x53/0x67
   __netif_receive_skb_core.constprop.0+0x132f/0x2e60

Subtract mac_len from the offset.

Fixes: 198d83bb3bec ("bpf: make generic xdp compatible w/ bpf_xdp_adjust_tail")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index cd0796a1dbfd..1934e11c4401 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5737,7 +5737,7 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, struct xdp_buff *xdp,
 	/* check if bpf_xdp_adjust_tail was used */
 	off = xdp->data_end - orig_data_end;
 	if (off != 0) {
-		skb_set_tail_pointer(skb, xdp->data_end - xdp->data);
+		skb_set_tail_pointer(skb, xdp->data_end - xdp->data - mac_len);
 		skb->len += off; /* positive on grow, negative on shrink */
 	}
 
-- 
2.56.1

