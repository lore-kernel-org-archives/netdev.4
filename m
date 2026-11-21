Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795291250;
	b=bF6rfN0OfliyX+tLYd7UZKlmKWXIH5eghMlYtFrxMnL1KOwZanwyPiJs+k+UB+6saj38
	 cMfmgDMWowDCm7AC4qxg5/jjFw7pkX24ZEIGiEe0R2K2l+tHe/BlhP1QXMftBS1gYqquh
	 IuMSfUFEuehnmm/TZTJQTr/2qvi4aMsxLOsn1ClrkRTGGYp9y0WdskXGlr7dT0tvAaCQi
	 MtLa/50gSaBJnwra00rVFPdzB3ng74xNt7vvewRRtsp19U+YsDqi3dKXY/hLB4ZRJcrqb
	 q5YJDh8Ik7kDCT7nmtUAKG4TW+8e9UOtPJ2R4d28AzsHYcHL4tDR4TowzwX523nLm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795291250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7HhrTcuAlkekQD6nLymqH1QuQkx+iwC8jwRAw0bA46g=;
	b=1DWPG+ElxoBuWcWjuBLV+FVrUJuN7qQHNzTqvwHnmrh+5EoIBv+8B7ImLR+9irO3pG8f
	 HC3QzVBPAY8m6VBMCj4zs94Nbdd56hnQhTsCQYP1Gg3Sl91mN/Y74/bZ/06SHsH1Hp4Rq
	 HLGix/GZeHUzCIGDUBy9W0V1wOWp0L99SqGIJs7RbY3sEOhDhtPfBFEsPu6v1T/cUZPOw
	 h++LXo35fFek9fa71/GO2rDrHIEwC9KRQuyRaWwN9kA2C8IcO0WS6L6wVclFACn1HOIsB
	 cyt3RIFWsJ40iPD2LWXdmr06v76NaGkr6HUcdvF5EPbUHkEvKBqqUYbP0LWMTFLiTYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pA/HvUny";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A150606A335
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A150606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pA/HvUny
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso753257eec.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795291250; x=1795896050; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HhrTcuAlkekQD6nLymqH1QuQkx+iwC8jwRAw0bA46g=;
        b=pA/HvUnykyEjuEMak/FiXGOfb0wuOZhIVkWLGpFFZDtExn5xHTeAIzBTM3m7VBUqpU
         E4+CamvZwbRgp60kuGji98jZqW1Ze4NshVgm343IT302QCIbtgWivnRZ8galqXbtHbC1
         MEVgLg+4wf63baVRNek0OWuiB9vwpFjIE0rp8Ll+XRjAq+K33mKHdZFyZDWOuBlTswwD
         M+TcRjBxAhVj0/XOjvhkl9fAzEbEPaR44OqIwiCh4TY/KkaPldBR9H7+DAa7uggRv1xZ
         sPbGKTEW3Asxc/ifezaY9zfujY3Dc1lEKsDLt6p64yYUQ1usnOwzA1VDc310dUmvzJ18
         93uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795291250; x=1795896050;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HhrTcuAlkekQD6nLymqH1QuQkx+iwC8jwRAw0bA46g=;
        b=SiGbVhpmFBGDrotRSaASCK5RGsYt4jzYypN8x3x4cReiQo1a9OfQnoyG4cL0+VOEVy
         aaFocsZUiw+Wt4B2MnYQqV3BzJxm8uwXngFg5/YobkRsitgFM6kedcbEKepzbdiZ1hyx
         t4gBkUoLPog1ONKdLEaJsPo3/T3m1xvbhM8ZzQXrQysvONKz6P4eCgkwiu7wg70t8n+B
         TXZybnrCfK4y6IqpbrLbISttU8Lsrg8Wz2+6IEyJw5sPMXYImDCyEblQBuIWLH9ajzRT
         X2RT8L7t+fVlcCzIo5QDApBk0esWURhkKkLU0RmdOGagHygrpv1TMBvsDgHEodgOXRwJ
         V5zA==
X-Forwarded-Encrypted: i=1; AL+hErEr6CLl8+O7iBcjuPJwSu8TiLIPRvq1IcqXsjQEie14p9wCc+UrMnxhxG5rANq7oZDR1XISt4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mqJYHPYC1C2PDqtMMHB9WqCVaEwDlb9sc4a7PE4hOCR3UXScN
	K3AvBmxpmPsQ4kj5/+b31IRzyQUZn7wzTHnkMioz1HTKINQCk+Emfd6k
X-Gm-Gg: AZFdTZfBbw7Tc8MUgwqg0kYH80nRNsTbZQZDMUYKiDgXqZkc9d/2ENdaZcu5BEKOK5Z
	dhkVOGT0yLZCwjfKVEjtKa5W0hKVjQMTCnQ5bnf8su5IlpOXlEer9Sioxpv8iHJTy4ewW95HdEu
	+TwmrI7XiwzJeYYLxkfDg576CdVezd3saBDKq+uB7iKNYFPNWzEl9y1ImEEsnoVN7ABH7+sPuux
	u70DY37qDm1e1WVMPT7h/qxS4noQPBhyEGl8sRyn+/AqwUkWlmzsJlv1nwHbcfKwSwvQTqcGP0z
	6A1drPey3dH6bszXyUYUCgA8sLpx8an+5wXnoPvSC+CgUvEAp1mgu+KICd04jkueJnAwp0/VOls
	iPugBWIuPcZq2gFDCH9BiG4jMRvDzwYKFQzvJSgjY7lNiaWXXLEYeJ1sMDWnHcOF99WScCijSfX
	dVr/rILFCXbzKDuyb+Y8j0Cai/jrVdM4n2rgYBuFpiXmL4WXU/r04gjx9N25EvDdWqT0h8Ay7/Q
	6arVKI74LdU3OfVYf3o9PME4Ht3WykmOkM+iIFIX3Coy74aSRePqJBZFC9BAvRO8M0kua8=
X-Received: by 2002:a05:693c:414d:20b0:382:cd5e:dc9e with SMTP id 5a478bee46e88-3869a1501f1mr4067454eec.13.1795291249505;
        Sat, 21 Nov 2026 12:00:49 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm23438603eec.10.2026.11.21.12.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:00:49 -0800 (PST)
Date: Sat, 21 Nov 2026 12:00:49 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Breno Leitao <leitao@debian.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/1] netdevsim: bound the peer TX queue index in
 nsim_start_peer_tx_queue()
In-Reply-To: <179528990077.3294.3095834745568902393@kernel.org>
References: <179528809256.2009509.5007624677973207521@gmail.com>
 <179528990077.3294.3095834745568902393@kernel.org>
Message-ID: <179529106761.2109137.12232270002163099425@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 21 Nov 2026 19:38:20 +0000, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

It was found by an LLM-guided test generator that we are developing as
a research prototype. One of its tests relinked netdevsim peers while
packets were in flight, and KASAN reported the out-of-bounds read in a
QEMU guest. The v1 report has the details and the reproducer:
https://lore.kernel.org/netdev/179505710275.3511681.13434978152402269948@gmail.com/

Thanks,
Kyuwon Cho
