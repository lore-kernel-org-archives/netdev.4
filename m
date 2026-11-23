Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416596;
	b=qh3/UDN7idUR1KWM8aGNzPxIW9dDi3+TsHFKZMFOoNLlWD+q/kZoStqydeUOV/A29Odq
	 cQB/+zW7OVIW9j0KBEzfNSaxA3mVjpF4HaMy98IzHKVBNrzeIslcwGWO2kMVNrLB50rMw
	 BcA3HSoaqIJdTGpNN66Xt87iLO6msGukIluhNGfFLIlKah5izzHwftjLVeMNRT9rPtGLX
	 Tt5ROE52KXqlGgoClgPlW0rgxtAfsSF1BASYtTNkEB6aI5H88Hu3de/pPIyDEAj7V3VUH
	 7/Xpn2+MOXDBEEfCKaQcbk6M65yfcF58dOJeZqHEpQQwNqEyvg+MU0brkUwlLphvjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=VWkjtsN4TDl9WFd6UDgts8vNtEvBJiL0lWopiTLtRrY=;
	b=hRMIdObRE5JrabDI1DV+wCj0RBIiKvpSxI9jdZd2JqOfvxspp1zNr2rRyIs6EjgaZgyg
	 pzYWxSYTQnv6HfcdTa2EUyen9qjg1HSzRvaK4SCKmA5fnMq+dS8Azh9E18hTtm3DmjJEl
	 mk8xXeAEK+TV6KtHKAoxD+8ZGHN9frx1TeDGhRD0U3TNkTy1RupJL6DdhyQG/3IhBpQuf
	 jtO0ALxcjzx/UPHg2KPsm6RLG607NXgKyVzlURxXntdON6OGH1eozhkbOk78s1lZXLyRt
	 M/kXWp5kCVGhM06G4zihY1SiLUEmaLL/adQpaoUF3jpfWQH7OuwXhNYI81P5htEDuUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=La2ax3J7;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5F606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D5F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=La2ax3J7
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2329708a91.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416595; x=1796021395; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWkjtsN4TDl9WFd6UDgts8vNtEvBJiL0lWopiTLtRrY=;
        b=La2ax3J72api3sc3l5D6ef9MXqUpoj11DOC6hRUoS9SYad50gNOWPMNmy+7JO1oZ6l
         2wtFpzA7soMsTMSoxMtYRkpnngAvgFYTzwnqtahjGYxGZ+BlXW+zNtW2PJseHm7+6nEx
         aad4lthd+6ETGiAgMggVc/wgZsyaIpl9mwWvm0Im4Q74Tln1qTzryR11Cd+skeMKJMHV
         5gARo/qeTnZ1eE97EpNjX59K0mAC3ycB8KzxA8DOt855W8Vg4YkWUfcMNbSGbWTUgWkn
         iTblSMeGmI49TwZX1Yg3XRbQDfW0w1Ng3X71sXX3vz2ZHnh3jFINOlECOZd0Yaq16/T6
         N4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416595; x=1796021395;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWkjtsN4TDl9WFd6UDgts8vNtEvBJiL0lWopiTLtRrY=;
        b=cbZtdJIj3YZ2iq/VBywpDf1VnBXJaJXcYz9HI+XMw5aXuoM5iTw5UTpwJpB/55I5Tw
         j4Pu1rGIGnJwHNWPsLG3rYSjUcsIhqV/zavo/aDOcb5+NnQuROktDUqUkKwFUMN/pd9z
         711dVC9CrgW8B+AwuWnJYSF8kG2Yn8ziJ6G7QYEhdOWNcG4E06e7Anp6rnt6ThURszjc
         +e066B4iB1PIbgcoLTs1BLaLtYplzCCyojKjuATrBiR+DQJwJRfhdcUjc2v+1Bbh/Whn
         r4l7pVbJ/+JQf9TNvqjyMMSkY0UMzflTHaNLrqKNjG3lrWR6pIRV1FbJjPiL6w284otB
         Uz2g==
X-Forwarded-Encrypted: i=1; AL+hErHrh5QOhio9qKMEcQJqOLA6ne1sQMPCPJsDpgZCOLZgz0klcPrRsJx0H+v+WwH/24abCofSThc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T/xh5QAebzciVeC456pXscmZyqwfCgjWvzfgn8YG2sAembPe5
	4Ypqm5DN5HOHzYQHhRAzp8q8dMczfOVEcluB5f5V5E6C2Q3e4bzqYIEX8Nd0Kw==
X-Gm-Gg: AZFdTZeeGt2yUVvdE4vNtgFK1BudCBHmEzfhtRafrSNIqSPU+Aegy4tiO6UF2FbwouF
	q1S576B76hQPqQGdeXTkgalL8kKDuzA5pQiOB6UZfxOt7dyA8X0+86zpFC0oLRmI7PjMlNgnU4A
	JIAqlGTFvFcALHFxZuDPBPRrCxBuRfpH17oXINnda+kG3WKIB43GtAdk/X1fJFl18KZJBPaTX9j
	Pqva6vebAvU2suFD0h7R5SI7VUTI5ElMugqh48fIPb7KFb1WOIwjeFXeyUYCk5JzgGBLhRcJ9u9
	Ig++clzYMwlHeoAU9XoKjfTuvoaHag79chqzjyelP+zwca08NSFPq6u1dvttZVUdpEMCFND23Du
	3kI7hu4n5hvSSnMB390Ms5vcdztjYFhQLj9b+N98OcFdxMQ5ujzrsajsZuINcFh6ld4filo7YSv
	aBgK/A6DzDv+y+rKkLXu3v1Eod+w+echeAf9Qa3cvypRAdZdxgA+9GD8IkxotAZJoBLP0L4unDy
	1bwyCpkt2jWFwfyEOUqCNxSg2VlLyj6iND48Dnd/MhBiQOeUTV3Dcwizg06nK+U6Kw0YA/MODRc
	AsXUFYmCMEfqAS/JKXkwgsY4Dx+MUqW/EZ2uCqa3RaQqPDk4+jeUHUupPbgi7XOYqXc1PmmMUEZ
	hXbdZ++mNeIjR31vGFsqtWn6DdXuSONz24w==
X-Received: by 2002:a17:90b:1dcd:b0:3b4:bef:9bc7 with SMTP id 98e67ed59e1d1-3b41c7d075fmr9977275a91.7.1795416594917;
        Sun, 22 Nov 2026 22:49:54 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm16171221a91.3.2026.11.22.22.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:49:54 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 06:49:54 +0000
Message-Id: <DN2E2CRNK19S.3QVBNS12O2D35@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Rongguang Wei" <clementwei90@163.com>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
Cc: <willemdebruijn.kernel@gmail.com>, <jasowangio@gmail.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <kuba@kernel.org>,
 <andrii@kernel.org>, "Rongguang Wei" <weirongguang@kylinos.cn>
Subject: Re: [PATCH net v12 0/2] tun: fix re-attaching the socket filter
In-Reply-To: <20261123054209.89946-1-clementwei90@163.com>
References: <20261123054209.89946-1-clementwei90@163.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 09:42 PM Rongguang Wei <clementwei90@163.com> wrote:
> v12:
>   - drop the EXPORT_SYMBOL_GPL() of sk_attach_filter() and
>     sk_detach_filter(), as Alexei asked.  It is a cleanup on its own, so it
>     goes in a separate patch and the stable backport of the fix does not
>     carry it

This text is stale.

Acked-by: Alexei Starovoitov <ast@kernel.org>
