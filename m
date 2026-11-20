Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194968;
	b=Vkvq7FTGFtn/g6RmzPPpVLndeUoBaV90T3ak81Dyfh1ShJ4kj/s0puKs2X322cRIKHRZ
	 2BB4WMMTopQMi8sd8zRQs/ojSKaRcH2m8hlD5zL8jwZ1SUh16pFS3XMfs2vCcVC6tCni/
	 heZqu1y8Kk5mw/Ahmwk+2Tm4jvLg1+Ak4ooV87FzN8KcAw8IBAUID5381t3t8F9O9z6Gg
	 ewjTr/ncl+jMHyfzoA/doWW2wYAY3GvNyoWt8reKmyHegx2mFVllQ1XOs7QlJekPe3ZqT
	 Uo3iXjuU8g0VJcnjrp2mpdCt9hJUjVpfw9UFssEa9GDrDyjfGtjidzdCa3iBmRZRaMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
	b=nuUlBniKhZ53SK7WjsZRrTR1ZbpyE5Ctps7TSjWOKwmkGj8NIu5ZiAsOHnCufLdBmwJI
	 YQNcnHKInxc+piNVYMvEGh5m6M8PaJPpuwqOIrGm5mn3Lw9VHLRlJ3V56gNtvCuKhXNpG
	 U+7lawjC2bHBE0Xk3mABmsM+iTfJhiM3Jp0PT2Iwd7d/gZ9x1gDmhKKt7UyiHeT3hR7Es
	 +YPpIaUArf59uD+JZqBviOpN+HR6jpSvDvyxCojQbDnuzlrYY3KqEphJe5s2xkcgwrHit
	 TIVAmGuitLCaqOvKsRe51iojl6SrWq+FRRX9Yrf6/s4Cu52bR/6evMLevVo+a5NicNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYj1Kphy;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFE606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAFE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYj1Kphy
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38431138772so1429834eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194966; x=1795799766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
        b=AYj1KphyjjLBd4V/PI0NWhMVoZYCdmaZRrY06hloFeD+T8gHDVou4ZKAzkkBMJMpFS
         DD/OL5TJJ4YfVrhga+du0R6u9ks2KrZUCMJ6/WAwoKqXfkGxIFmPiSRnB9/1vup0Ucfh
         MHHy1HihObWfHY1g5UY4DJSh3d6sPl2alK7+CMx3bzJexjOquxX/BeGJbcPU2IyS0BCO
         y6O5u7IsCb8I6xcx7K9hvraMy1APDNKGB1ZTtC97fX1s7LOGk4cOSmoqwTjtJ93uggvo
         Lg5Cz9LcamiyjmNa1aEXv4huAQlai0tFrqkYHpOfqqFHQJnaHrx+RTge4kaGB1t4SnLS
         NCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194966; x=1795799766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
        b=sxaFHyJyw+iAtIHIO8NWBajkrhlrqOjVm6i15EomMh2NbWQkKErgPhIrTHA8egb/18
         Mfkf7aWUTIrXQGv9bNmbufuaNCUKOzJ2gCFnC4iFvtpGl1j2dl8pVtK732tpTfspsusB
         MSLl1c4ApvGU/F3VTfD2p3I0fXt/nPFYCxnUbJisbhwEqj1PnlmWp7OmJeSYIihUSTxB
         NyMSZ2L5gGad6THmEb54aN3vHo2PRmIiabqQ/J4HNTlbjriM/6h3O8hKKOtHFGI31cWz
         mO6VZFJ6qxyZRvgXwGNI61Y9Qt1bmwkEOx1JMAt0fkH+BwYSG3ICGzV9RngrhbXNVEfz
         Lg+A==
X-Gm-Message-State: APuU4Z+ZDeKZerZ5ozRM3v78EjOqxSvOZE6zlNfz6DIE6jpzn2+dy4nJ
	ACUw3fTkrsrv/IXi2k2UgNNFEMy1F6Rk8q1S7xs6YxtiW12ojAFjPhhT7vu98ZraFN0=
X-Gm-Gg: AZFdTZfes5Le9sRtdb4o8oHjzBtn5iwxAeej9s6+KKkC+0bl4h4roxMar5R8tXGyjn3
	BCU8WC/xq0M5Zvx4vr6xgTaXPWK0byMrPHjg2eRJsATIJggLW0IBO29NtyLpYOlxdMvUskPsgtU
	Dtd0IMmNusr8ZPifvdTPSUXHv7VgzDtOdA2SsPh1Jm74HA8OXjaFNsXyRzcDkSfLbmB0IjVl9+x
	BjTLz29PKKQ9ixvdlCqzUkBnYIg0KCOIW1O089b7bqBvv/IFil0+TyS1ECdDEEvGBUocCwm5BmQ
	NzTLw/0mtzBVV225ENS+fj+6TbQ7O4sHFzPT2hCXQbYAUvfZGMwV1mVpf4LW761yFsHMbQtT2KB
	6mawtLouMIHkOKtt2VZkjK1gQOuY00kNAUOOsnSy3xhh1jGECwCSjiolytSmyEIX3WusuTAzh7X
	kdrbqE4C4w5LLuyWWwk2ou4uwJX0W2fbK0I1SHpdiJhrx7ddeK+7Q+HjDj9+zLBb07ZyixFVfuL
	s8HwWKqHmhQcVIgxT4SV69GIeQm+dcdPoYNgxPUYAjA04D5xa7HKlRJkC3fhKzlbfOqdt71Tv/D
	eQtB5Jq2eUmMWM9lylrZ4dm77fYIYxkW4+dZSllo15oqefiyxi/shxSUzgQ=
X-Received: by 2002:a05:7301:7188:b0:384:b800:2adf with SMTP id 5a478bee46e88-38571027b9dmr3560666eec.27.1795194966043;
        Fri, 20 Nov 2026 09:16:06 -0800 (PST)
Received: from localhost.localdomain ([1.238.129.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm10816041eec.28.2026.11.20.09.16.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:16:05 -0800 (PST)
From: Sangmin Lee <45sangmin99@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v2] docs: networking: correct skb_shared_info field reference
Date: Sat, 21 Nov 2026 02:11:31 +0900
Message-ID: <20261120171131.73045-1-45sangmin99@gmail.com>
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

The skbuff documentation refers to skb_shared_info.refcount,
but struct skb_shared_info has no such member. The actual
field is skb_shared_info.dataref.

Correct the reference to match the structure definition. Use an inline
literal so the field name renders without a leading ampersand.

The discrepancy was identified with assistance from
GPT-6.2-Astra (xhigh) and manually verified against
include/linux/skbuff.h.

Codex built the affected page with Sphinx and verified the corrected
field name in the HTML output.

Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>
---
Thank you, Willem.

I've always wanted to contribute to open source, but I was hesitant
to jump in. Your thoughtful review made me feel welcome and excited
to keep contributing.

Changes in v2:

- Use an inline literal for skb_shared_info.dataref so Sphinx renders
  the field name without the leading ampersand.

v1: https://lore.kernel.org/netdev/20261119164351.49040-1-45sangmin99@gmail.com/

 Documentation/networking/skbuff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
index 94681523e..15a9a9399 100644
--- a/Documentation/networking/skbuff.rst
+++ b/Documentation/networking/skbuff.rst
@@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
 
 skb_clone() allows for fast duplication of skbs. None of the data buffers
 get copied, but caller gets a new metadata struct (struct sk_buff).
-&skb_shared_info.refcount indicates the number of skbs pointing at the same
+``skb_shared_info.dataref`` indicates the number of skbs pointing at the same
 packet data (i.e. clones).
 
 dataref and headerless skbs

base-commit: 362917b0b26bd16587d41a37f5fd1c252099a73c
-- 
2.50.1 (Apple Git-155)

