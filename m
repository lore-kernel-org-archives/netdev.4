Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866358;
	b=HvOdHxQ58f+xQPmloHWUV7DVHFC/fl8MhUBLR2fjKciM1padHgYbjg3GOXsyXHC0KIW6
	 CvWckv8kXTWZwrkaw7WOQj7hT28dpBgYgW5cg+YjrDSj6H49vijcQwlFsE8OJsxZ/ep2L
	 8uuL2Mg45tqHOGyqYDX2jq1LWqCkw6mfRWII425uATV/FAumUCy3ylYrKspZ4qHmW6w93
	 NrUazWdI08poZ4uTopMyZ6lzay3CHbABP+6cz9fclPg9xizUm2IpDPJyzjcckV6IZTvom
	 cQ89lszEKTc+IL7bbG3Xzxfnrmv0mzbgPSwMcBHu21RvAJcc4DzMW69RK4r+EMbD9XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zBAw8dUpXWrrifwZKQf8BbOPDmksqO35VTEdiKGvRdg=;
	b=F4akaYb6/ZSDmysd34at0ETx0MBjFg4EExWQg8Mq5z+ga+s6rQLiFq6XBPqeY2lDGJz3
	 BNvsyyMmZnK542ZzmyKeogSGlLz1/RhqtsAZSONmj5ULvIGszEyfoZb0445I1PfEdFUO6
	 UQcNL7ammho6/zD16KGlxJPivnFxautU3EFTcoyknb28MczrHG43FORiqMJiYxjSS88lk
	 vgDDTHsF6FNWdcv4+Z1MIUj0jX5CCb1C3OqzsEwMbHT5lRqMSBaSv62kMHyiGZAP4n1lX
	 iXdIhhpL0uFDidDu31V5CJJ+YyYDH7Fqw0VkxJMIGTBURDIYGotRi0v4aVP22xPlUBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jYBaJrwu;
	arc=none smtp.remote-ip=209.85.217.69
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535A606A33D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7535A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jYBaJrwu
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2e2cd9c85so3207665137.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794866357; x=1795471157; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBAw8dUpXWrrifwZKQf8BbOPDmksqO35VTEdiKGvRdg=;
        b=jYBaJrwuepVTUU6d1yi/dQxjFzIul4hpcJ76pIc9G/Uvuj/jiqT8o5nw2IKaZbwlAT
         5wl3G96Q9o8GtygjXozKV6gMl5B35cr/8+X3jn//cJhsfqwMPbliu8KMD5q19bBb5eii
         mlmx/rqwoQkpBKmiCuPaEs9beGGbj2C+HQWJ5T18qLKrCx27b7KGHYNlmvoHtDcXBmK6
         h6+cidKqWqPba6q8UN2+ZL54aHEyX6zoYIWzrpN5Gk/fzxXcBZggURN07wYCR4syz9Ta
         VcgtnUviwzccehGi6WRw5m1NnsFb8UWGPsINCcYFWJjDwkjIg1zCdvGg8EFf9cdW3DGg
         NjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866357; x=1795471157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBAw8dUpXWrrifwZKQf8BbOPDmksqO35VTEdiKGvRdg=;
        b=lMVuO8nVV5ReQj8oP4k3wMYpht0eLvibgOUVclIZe45kKKDaaYQ1A4abXsBjlnfYQW
         RO395e5VXpZkwLypcwefCg8f0J82atXCJB0yxzn7GBgbfzhCcWRkD3On9AKV6gJ5SMce
         8x0tF4q/A2+9toctAYj5b5eaOn6eFWOhbm8lRtXXvtNGfFpnHIpZxtL6/bHp/UpAbnc3
         q5lDaFlVcW23knC8Sg4k3KyFK/hR7LReovaEWfxnLbhqb7PVCadBLW+G1px8uwElVbbG
         NmFUKY3KyA/Dza4NKua9n89cUaMwmUs+fUlsy4CuX3V/LiPXzMZDYZ07HEWDB+8IwJ/G
         7TBQ==
X-Forwarded-Encrypted: i=1; AL+hErFusiOA4um6fSDZYCMm0Q8WAmqmQdXMfy7Ezwv7u/B8xhqCEzu+UKcihyiaBDjFmat/MbXZ1VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qZyxpRS2D8dcAuL9z+aBJ00rptVdcEDMoxdZlORoNuNhpJLbn
	x1bxNwyMXHXjvMffcZl6v7UmorAIjdd2UIDo7ev3kt7+GQGLPArnIvA/TpOIjQLT+T6aarpfgKR
	RTsO53km0m2ibtLyclLouDxXHVA==
X-Received: from vsrf7.prod.google.com ([2002:a67:fd07:0:b0:7bd:f662:422f])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:548e:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d64d6ed863mr4498585137.7.1794866357091;
 Mon, 16 Nov 2026 13:59:17 -0800 (PST)
Date: Mon, 16 Nov 2026 21:58:56 +0000
In-Reply-To: <AS2PR07MB912321354BBBB27BEC882C11A37C2@AS2PR07MB9123.eurprd07.prod.outlook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
 <20261114161248.3428695-3-thaisonphan@google.com> <AS2PR07MB912321354BBBB27BEC882C11A37C2@AS2PR07MB9123.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261116215856.813379-1-thaisonphan@google.com>
Subject: Re: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: Thaison Phan <thaisonphan@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, "Olivier Tilmans (Nokia)" <olivier.tilmans@nokia.com>, 
	Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 02:16:40PM +0000, Chia-Yu Chang (Nokia) wrote:
> Thanks for the fix, the only change I propose is to clarify the above message into:
> 
> "For AccECN connections where the listener marks ECT on the SYN-ACK, leaving
> syn_ect_snt as 0 causes tcp_accecn_third_ack() to see a mismatch between the
> expected Not-ECT and the peer's reflected ECT in the ACE field, erroneously
> flagging TCP_ACCECN_ACE_FAIL_RECV in accecn_fail_mode.
> Refer to Table 4 of RFC 9768 for more details."
> 
> Because RFC3168 ECN does not use this syn_ect_snt.

Thanks for reviewing. That wording is clearer and more precise.

I sent out v2 [1] yesterday before seeing your note, so once the 24-hour
repost window passes I will send a v3 incorporating your clarification
(assuming v2 hasn't already been picked up by then).

[1] https://lore.kernel.org/netdev/20261116023709.132684-1-thaisonphan@google.com/
