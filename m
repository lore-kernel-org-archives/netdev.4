Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288305;
	b=JMn0USdHmpe8m6Y2E9vH88sCgAvnPjPZmd4y4XAqscDT0oqdqNpr3purzMFNBKTBlJzI
	 7qnBmohK2DkI9KLE8o4QRntqM7xexa6p6UoQ6uBzIkeqSQ2Gp416P8Eo5tB7e0azkmYEu
	 2JxQYzAIoAnz5CFedLb+1n7WLJQ0DQ1//RxASLOiAoy8VO95vD7pnweMnPLheWdwNvPKa
	 13Y/XwJPlnThduyKRkznTsrPoTcvKkF3fVTwxmRcsZCFX9xluO3bKTWqIbcYeQrjMQ1Cj
	 ji5l0XdX4G+1tm9Vi0LOzRq1Q0FZegn85l4pipImP6rYurzfun0L79pDiXNJuqTG8BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y6P6OYPNefE/E0SWUuFH8CtSK+tbzrbcG9H4Aj29aRY=;
	b=mkVHYMUQoMoPFF4WBDmo1ROCL+eEod+fSrQjitQ7+gsxWLIV/LWmNIv0Llhu9/FgkBxg
	 809mmHeV3pgE+VjRWopByXrnSLoXJVdno0WJvz1Oj12/Cs01pzfVblhvhABtLCRE7zyee
	 QWSe47f756BdlUY0eba0fJZugAdN6V7dOXBMTu9Y14Zsmym/4jYaLy7abLtzrNwfPvXGW
	 Cy1wM4mKRECnnRYFzdThdTdZH16Jp8AW0EZQJZ5hI0ABUOMpENdDUr9ZwpkXUkj8kDzfk
	 aEviJDDIxK+gR/2AuPrRVKvFHfjxFAaFkXY4hV7NXx8pkiXF8tUvi0hOXJy8C0UNBVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KA3LiyFh;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2A606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KA3LiyFh
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05c68629cso8577655ad.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795288304; x=1795893104; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6P6OYPNefE/E0SWUuFH8CtSK+tbzrbcG9H4Aj29aRY=;
        b=KA3LiyFhaWYjKEgWeyUjp2YTelF8Ezl3+tfj6Q+3THJbJMaz5qjJaXMIxeK/h/0I/f
         fqt+MUtCr/f9yghp36kRiJI4EKMNHb3ZKe4xJQ9lP9YBKk5/yOzjKD2DL76KBGQ8ydBf
         rvxturR0OM0jl3IeJPux/r9ltivh2hswbYivHNSJTokJENhfX29cSt4pkLbX65pb+kcw
         pIFrHmAwqLVmrDkg86567qBF5uW0YvdTB9fHO7QP0WaNoKe5h0SZ7sCoCui8tBn+P7YB
         n77s5panQ2i02O/yio5og9dHWqHwjKwfcJ0+TfWsIpYIHC/0IgqePK5KJLn5CvC11KoC
         DhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288304; x=1795893104;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6P6OYPNefE/E0SWUuFH8CtSK+tbzrbcG9H4Aj29aRY=;
        b=LohoxDATbfJ2Y2/XGOPwHIhaHOpoFmPFa0hagMK6fglIKlOfL/FtLw2O2s1DMqcqum
         1R5z/Hdy0SUgZ3B0cGJpIgK3qFFyN425ObYXNupUxysEWbsfY6WxwYa/wJlIQoW+XxK3
         RubtAEkuu6BLAbfvmsr2UBm6MbbQ3+DVVUnEY6r5LpdxzrxfX7D2aBSznPOimnjG3T1I
         QK4+JSCUUXAeAWHHxi+R3zqIprmq+KveS3gEyXMfI91uK/IkJr5vAkXVpVZmo3q1dDfx
         5GAEnmsWi56FYwuZk60xn1oj+xmT7Kby8YB6aaw9+Kuw0VtkMJkUq+K7Bthz0ORf71JQ
         wp9g==
X-Forwarded-Encrypted: i=1; AL+hErEhApxjZ17TJ6wv5lmBWtY9QH9A18NSFCUhIyxWjg5fTwWwA2wgaovI2BYISngnhcPmsNktuoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uzG3oBZnZvJc4wbbADS4Nma/QMk7/zrwZJ/g5Zi8bBybSXPtJ
	ElTWqJfuH9Ekhg+0aoQBiQT2u+pI1S2UEZKptuQp/q44lbsdaafKtno2qAqRsr5WjQON2tclYAw
	zvbsW3w==
X-Received: from plpo21.prod.google.com ([2002:a17:903:3e15:b0:2e9:7bc5:bec5])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce82:b0:2ef:ed4d:d694
 with SMTP id d9443c01a7336-2f03ef3d33amr70048935ad.4.1795288303932; Sat, 21
 Nov 2026 11:11:43 -0800 (PST)
Date: Sat, 21 Nov 2026 19:11:43 +0000
In-Reply-To: <20261119101538.3229466-1-edumazet@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119101538.3229466-1-edumazet@kernel.org>
Message-ID: <awHs5yZyi002msnJ@google.com>
Subject: Re: [PATCH net-next] net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Jiayuan Chen <jiayuan.chen@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Thu, 19 Nov 2026 11:15:38 +0100, Eric Dumazet wrote:
> zerocopy_fill_skb_from_iter() adds PAGE_ALIGN(copied + start) to
> skb->truesize for each iov_iter_get_pages2() call.
> 
> Since commit 394fcd8a8134 ("net: zerocopy: combine pages in
> zerocopy_sg_from_iter()"), a chunk that directly follows the last frag
> in the same page is merged into this frag, and the extra page reference
> is released. The page is still accounted again in skb->truesize.
> 
> With iovecs describing small contiguous chunks of the same page, each
> iovec charges a full page while a single page is pinned. For TCP,
> 1024 one-byte iovecs sent with MSG_ZEROCOPY add 4 MB to sk_wmem_queued
> and charge 4 MB to the socket, for 1024 bytes of payload sitting in
> one page. Appending to the skb at the tail of the write queue does not
> check sk_sndbuf, so a single sendmsg() can get sk_wmem_queued above it.
> 
> Account pages while building the frags instead:
> 
> - A new frag accounts one page, as before.
> - A chunk merged into the last frag only accounts the pages this frag
>   did not already cover.
> 
> The accounting is unchanged when no chunk is merged in the middle
> of a page.
> 
> Fixes: 394fcd8a8134 ("net: zerocopy: combine pages in zerocopy_sg_from_iter()")
> Link: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
