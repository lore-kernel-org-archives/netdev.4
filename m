Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683334;
	b=GpE+sfOuVnYMR0PjcDozeNOFvoO6ClU/BZNlYD1UdoSb/zvQ+RDo6geZNJ4bL9TUBgh6
	 JBVx5ch0Jt+Mc59/1quSvemVdypRYEkmjB8HhJ0ICkgvQW78Ps57wtd1rkod1btNAyJFf
	 6sqORDbHCBTYsT9XlAGNI5IkjivXThYyrru59NQru73ndwyao0VABM0WG3TTirZpLmUXJ
	 EMBCuHnIs6UpcbQIy1It0Vxmcxavb3ftBRHssI8vxIUvbarlHOL2hOUPxXPyFCnCUp2W0
	 a8IZu5lf3nKXNSBMQSY1DydpUHsBMq+4gbg2PLrZrB2f3IRHoJgt7WdMghFNPCwFYeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
	b=fY6gB4Atu4lOJitrSn23cEcqV22ujlYi6iIPA38cZ9z07z+NZetfQGdk+ydrX8Hm8tzc
	 C2bKlGAzVN/k0BmApvXD+jdQ/Zyl5onA6tql1hRkPg6TTT37tgKu8KsK/8CRw1VspcVTc
	 WdcnLcadwbNb4SXL9K4UtFMOFvL6WhV7nT12CeYUbxyP1iPaaZgdlbErHt9bmd1+NoqW8
	 OwTkdna/whTZjC4KYh8JZ7yLWgjbXBAUdOtQjFJY5hnnV7u0xb0lABcRmTxxxCqST3Ou/
	 RxOZOl8CRrBhnxf/CgkNAsQcn/AUenIxjLrBwgecOXrik7BDteTYdG+48UaVBSj5X5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX6nwmg8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958A7606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 958A7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX6nwmg8
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso12447035ad.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683333; cv=none;
        d=google.com; s=arc-20260327;
        b=i4JPcxPdGf3jg0C+tz/NUr/aCUrpKnd8js8KdWxW/T9+gmIWrlV2wxx8NqfGvdwSri
         sSpyzr6RfnF+mi7MNQUk/jR74Rfno6s2VVK4tdYRZXbAZ/7XCbu3yFIqPtQgLUsqjY+3
         NTk4fZOUgRDfUCwzBqzf0qatfw4jg91FiyDNuqjfABlEM6L9D2Z6k8i6IGy3gmXTPEBk
         QWgZao8iX+PLeVnHMFoPHQPnQhu5s1HU6Y9dqb1UXTHnzoeJLMLyGT4ahya72L8WOiU1
         BwWpcZMqz6LDcYJprHyjrp2on9+Saya212bzuHL7Nz2WBVfMnP2GHwldOZT2LAbBLHGQ
         Umrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
        fh=0Bwm3NlyoyOBjYakV6iagexMH9hS2JitIUT3LHFb2h4=;
        b=jx3Wx8kbrcYR5pHJExAkfFcv8ZrrXdJj5D182eyZcCwcFrN86KwITOzSgOdaHwtvBx
         O1BQXcZD0zq1CqxLGbVD5aj6RL3LovbO5egEfvGq9o75lLwDVSeZTfUaHzP/d3hVm+Gg
         Z/woHiMXFiS2RmR1Xlm4ifU4GtQjgCudOiyqwfwZDUYZHvMUMbtM0xnaB4PJcelovr4E
         5vDSq+BS9YFK1vXSrnkRIcK52OZz4Y/+QWLYe+dTw61RYfub3mm45xT6tvQdxXF+mwX6
         H357Boq4abzuwWWONrzXFx+1EWGbqsMN7/FstAZ7JTP1fAPgxdgXS/2HjvzIlESrJcr9
         2dKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683333; x=1795288133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
        b=hX6nwmg8Rs65GoXZ5zZB7Gd+AOh9hOUa96uBWwnYwRTzYswLc3aPgt1QSSWIWJ2ZNL
         w1OYUFY9NOmjZaShrhx2Jj1npiVNQ04Y6Hhu/S4bTfRY274mBn73KcPczVJKNfaDyTq/
         s3EPjaXHTJx4ZUmVMtOGA+yLUeLpUtEhqR20JdQzsRQOCACtHjU4EzlwKOZC7SIxXH1w
         /D4nbX2IcT9o7JbKePam36e+s+dAAKf2HaVd137ni10RqdwaEWxW0E6gqIN2/d1OAQBG
         HpgEmk+cE8pKWnk/iVZuCp+BQ/Maeb2RHfQd/nXiMu3P8rJ1lUkCy8bZejy+nfIARXfJ
         sWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683333; x=1795288133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxmRDFoHxpt+qxahysWPY8cNjC08++XK90U4r6nVLsw=;
        b=x+dMcpbYRb3JMiEJ3BcRH/c66vKk7J+q+GinYYzxCVDl0EwTN6KP7BQRXBTc5JR3mJ
         ttKYSrJRXVRwKt7z9QbYsjnOzqiVWMUUo3zcK1wJdZbtevF4/2BtlnDOG/HcISn+vub/
         V6jyhgIi82BLuleqab4lyZ1mQJ8HyQAV+gn7543lr3tsSDwRZfuAOAvLYndXJ9IlrtNo
         F5mOQnSTQgaTGZmt6oYi12fjpmpt/pzZ6gmIWhTDL8qocL5mMsPEibGCZaDgYEA6CF8A
         qdgNcvSIW+74N8Y6AdRD4AvSwoYWUPK5asX4o2a/fQRypNHQ2YW5bOaQePcysoagDdzf
         vPbQ==
X-Forwarded-Encrypted: i=1; AL+hErEGybQzNx+Fr/GF6hdhRXoT0HeP9lNZUC5bBo6sdyi1rRsaAIh049ic7Offlt1Gpu1fsIKtTro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iiv6kUXhfU81EvmBP2cF4GDozdSwo6DIHjyxjRXmU43hVi6eD
	htZh8x2TwrLSkJD7Qis/peu0pMgzpUJnXIUTWw2jQJF0CpiAEGVA7VSVzs3wAo92fMhze9gKHXX
	Fv3LFG9Hay6bEOeSK/nf0GCrLVp+cttA=
X-Gm-Gg: AYBFou3Rwddwr5+c8C5CatGVZiC/Ud9Wt9eC3PIhFz72wogaBDeS1yez0ruORco67yI
	fNWokvHRVh9W7AflRcxGDarGz1hccWBDyuLIi22yGuRGwIDqB1Mx3WiMC7L1M2UHvXxGAp/Es8p
	fkxCwpJpZl5uZ5oiBNVOgQRJw84tI6m+Jpk56zaAURmiKYltR9hHIe6WF+7pC/BZaPcU++w9lXd
	h5lZmc+q78NUDl3vmBb/THKggaILj3mQWj6p8cja09aTLlBP/ekv3Sw6XjQkscL2/9nNeFeTd/l
	L9vqnIU4B8ohRxxiW1tKhfZzDylOhTnCxtmnuqjBOlDVLFivqmRLzBSEpMoAnb9RX0s0AqAPJU7
	lmzyouhdhhZ4CsUyBdWsyaVW0peHu92fTh+MpgzX/oLa9LnxOk0r+4NZbBsHodneVv7TLwQagMv
	jgMYgG17FhaAaKF++smbhe8V63C1r/dcHD85v1Ecg8lf7NuV/9++A=
X-Received: by 2002:a17:902:da86:b0:2ed:1fb0:7784 with SMTP id
 d9443c01a7336-2ee0da7bd5fmr58535095ad.10.1794683332797; Sat, 14 Nov 2026
 11:08:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030042138.73739-1-kylebot@openai.com>
In-Reply-To: <20261030042138.73739-1-kylebot@openai.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 14 Nov 2026 11:08:40 -0800
X-Gm-Features: AclHuK--H_3_n6VCnyOL61NaQc63vtDDD0D0yPb0rGJY-Xl4-Bos2pmaPEQ1p5E
Message-ID: <CAADnVQJ=nsuU6GTJFG8VnF1drWW9pQOy9=fB3UhUyRYAOUmGuQ@mail.gmail.com>
Subject: Re: [PATCH] net: skmsg: fix copy cursor when coalescing clones
To: Kyle Zeng <kylebot@openai.com>
Cc: bpf <bpf@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	outbounddisclosures@openai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:22=E2=80=AFPM Kyle Zeng <kylebot@openai.com> wrot=
e:
>
> A splice or zero-copy append can leave the destination copy cursor at
> sg.end. If sk_msg_clone() subsequently coalesces with the last entry,
> sg.end does not advance and the cursor still points at an unused slot.
> sk_msg_memcopy_from_iter() can then walk around the ring and write into
> older entries, including file pages spliced from a read-only descriptor.
>
> Software TLS can reach this with an ordinary MSG_MORE send after a file
> splice and a splice from another TCP socket. Both TCP and the TLS
> encrypted-message allocation can use the sending task's page fragment,
> so the TCP-sourced plaintext can be contiguous with the next cloned
> encrypted-message range.
>
> When coalescing with an exhausted destination, move the copy cursor to
> the tail and set copybreak to its old length before extending it. Find
> the actual tail on each iteration using the ring iterator, including
> when end wraps to zero. Leave an existing copy cursor unchanged and
> preserve the normal coalescing, reference counting, and memory charging.
>
> Fixes: fda497e5f5b8 ("Optimize sk_msg_clone() by data merge to end dst sg=
 entry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

pls respin and target bpf tree.

pw-bot: cr
