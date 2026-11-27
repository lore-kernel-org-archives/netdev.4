Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823469;
	b=oUXW3Nwy0d0H0k4AJZB1aHyU8kpgCi6RG2t9us18suG/R93yAiSI0z38noeiIv/CdcX5
	 6iF9aid+C5h1UGtt5PiP065BDCwk797Vw5aB/cwgT80QyKz/xy1/2BwjXM32lIpODdENn
	 Syc+XrkJIy41hSNuU+vlHzLHLF08UHMtxfb6NVHgzTvuY6yUdlnUrvZI/vydq+Xq0hPiW
	 jIURCvTo/lK5Zw9PmetET7WpJqT7UJjTrdZNBJ5g7gobzhNtmD8dLGMAZ7hGgV46SRB8y
	 NeDmfjPucWxZg4FIIug8+JApFKhCiBHBkFzrtvaBCIxliZdqFBnvgA2MlgXuH2VzBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
	b=yfGIUTL7OVRICb4hdqk8NO1mIcAQvw26CSMCDMhrtn5IxSruqwuHKEvCDYobuygqulJM
	 okPtsBOMKiEiB4F6/ihOXJx97iL7z/1foVNV8KK451zQrfRGQkYAcE6nUFtjgEmRez34y
	 RV+SGyM6rv647AQlkq8lBfjOAWCBF9b5IbjifZyoTlaQ0ruXjK/S8qqq6ZT1KejbwbUGY
	 8QULZBZX9FhTcnTEgNk5JNlVPMEJjE//bjwkaoU0ikSduG6LGSFtaGatITRZJpA1EnFu4
	 X+nfiHiUW8XLRwh9cLBumW9M58DYdKV9+a3XWtSjJs7IvG1LowQ2w77st+ggIQn4UNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsRBJCk3;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB67E606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB67E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsRBJCk3
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f052ae3c86so46772195ad.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795823468; x=1796428268; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
        b=XsRBJCk3h37CLoNuGVplS9B3qcgNJLLmLUTqVwgmIkFkQhQglYtGNLfv3eAz6mMA8s
         IktkZErgR3mttJlLafpvgr8BqNKTdB5oYd8fn+76KRDjakGh/n4qJVwh4/nQxuG5kV0J
         l9XD4U7jXCtd+NPd9XbC65XqToOMCS5dDqyM+QGwuQX+v1WqNsTor7gtOT+yx9xp7tJU
         esjjwnrovNs+/J5O8oS6rh7r3VFuCWgn1y/vPY9Ip3dpV4zBgjqQGs2egNPqhyouKdLH
         wTedX2UL0RmoB9g6lwn0gSQUH1LWWyQThd3Ji9lsOotG0h17iWKzimw9hmz9LQHkCigN
         7k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795823468; x=1796428268;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVOmWfdqIYfeqYTgBunQD6m9OZ3k3UGq1oiUDE8grf0=;
        b=FkafzTAlJ361B6CB9KW+STaU3bksfmSCV6RZau9H7YkDvAJ9SkmXYX75YneJqRGdKX
         ui3KnKwfWkSMZo3I0+XyUnwTj1Wh/WidtjS3BZS9cOz31yJhvxJ+rdGnH7/K7r1Z7C7e
         t/tgdJ28LAjXGBv62hF+omf8Wc26R6gOy7e6GZeHxtkuAGXKmhfa6mWPlwUt/uDZJdTI
         fLcr5sUblDx99AkrtSwUHuIdWAcnON+GYq1Ddj4z3RgLsVCv86DhIDvYvXSeynHi/KLT
         xAa/o16iztcjOEVXpJTvpTQT6N4LheE+BpLrhZutn3c67ykF3FQqpNFmsCZ7G9d43WSy
         +ubw==
X-Forwarded-Encrypted: i=1; AL+hErGmgnrtfABVZcVO/Hq2NViRko7YbEbOl3mptxrH8sgzkOnkj76nF2h1Yu+lJJgWmYAKH5k+gZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L4VdWqUwFXjNBvbVPzESKziAoExxX842vR1Kl0GqBAs3Flhjm
	IMUxij++YPGig8+XQ4FrZAPM2x444qiwuIBEKOkMTY1/zEoz4b7k+WRV
X-Gm-Gg: AZFdTZfSXmScThG/W9qdpAfnOjt7bMFFLiX4emL+dYfAuB2UdbYykOL0HbbYdicX/Ly
	q2uanGxventWLCHA1Q+48ltLWuCJ5vSp/2tm0kpuoZKZFxxAtrbAip6IhLO3tSrkd9TvW/Krqd+
	gOeSR7xJJV+X9wNvNhgYn7mtgORhmfg7zVbQW3vS9oGAmqgTREtvGEMHjbvhuARB6aWdccocpQo
	Ag/hO/XeinuOkn1kyGVsSnlBteUVsSWRhtLtAgOr1b4XdKFNu8us5UlX8ItG1j/NGfJOlcwrdJE
	aBVM8s3IBBs5h/o5l0ts6khvEfW7J0zIqz6EKfmB5vmLijkVePSPzGLu1XhYSWvSbHcaWrl6R52
	jz3A7bFP7h+lNz43ACHR0DlfdXt7f3xZhMyNOvKpt1ShVHi3Oz6Ni3qGCwYqA6NLPajON7YpQwW
	5W+ymRbZ/Uv24abc7oiN+nRI7wli4mvmRTVbGpGUOZLiupxRwf9SERPj1RWWQtphAM4CyZEh+hF
	6BEIOT5i+ty/1YmXq8Uzm8aYeEBxfyZhS9QTjSerktr3R42fARe+HjEIBkbH7ReOilo1WUuPSWw
	pTWoMu1AdeIZV/a5y531bTqMEykdTZjgEIldnNqhTlhG+UqtuRglqF3VuCT9VeL5sERoLoGNbcw
	6mfl753xLxxTNMVGYgekv0LZ/Q3NXq9DoIg==
X-Received: by 2002:a17:903:230d:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2f03f1770c7mr274805035ad.11.1795823467843;
        Fri, 27 Nov 2026 15:51:07 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm128158155ad.63.2026.11.27.15.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 15:51:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 23:51:07 +0000
Message-Id: <DN6EAFMXZAIA.F3ZIJ8N3OJ3N@gmail.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <awmn-8pxvHphS_xZ@sirena.org.uk>
In-Reply-To: <awmn-8pxvHphS_xZ@sirena.org.uk>

On Fri Nov 27, 2026 at 3:55 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/verifier.c
>
> between commit:
>
>   02d3452bdd80c ("bpf: Set the run context for async callbacks")
>
> from the bpf tree and commit:
>
>   d83c595d9480e ("bpf: Put a barrier where no mask fits")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks correct. Sorry for the trouble.
We're seeing more and more conflicts between bpf and bpf-next,
since the verifier in bpf-next is completely different.
We'll try to sync bpf/bpf-next trees faster,
so you don't have to deal with this non-trivial conflicts.

