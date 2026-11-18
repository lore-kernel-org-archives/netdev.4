Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013416;
	b=oCtiDiBIEq7cGplhuW22TckHjakwBXjc/vcgEkjP2c13DzrDKrpP2ZzXvDzOAYLkJaxN
	 JgmjEFzzmuaSdwBrRbJIVLj5Fxcf6/xG8vAcKvlLymhMFDLDeFkQmSxK9sHfnuTgPSS60
	 p+mBsdWpKSYyTsE31tXC0UxtuQXrDe+0q+/s6pMhWWZNaEDcCN6gaOkJp30qR7+K9sAqp
	 MrmnavfeNVkNfOF/XV8i3pRfw46+n/k91ykSERnT9/1uET3TyEM4b+SS4wBwds4UGDC/A
	 ma1noyfsuofAZ7AtMzm2/wcnU0vxFs3xndyADNOdhExEzX4ptboJIOWhGNdCKXIje5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IrwOc17sZXoFCT3tkPfgb8s0Vk7AkFpm4r/CP425i9c=;
	b=MW/ROxfe7uK2CxWW+7PDBxuRUyTN8ovzDS7ZDWkifGmEJQl0JBdxdMVDz8Xaa9uJCXtm
	 ot1focM9xDT1PEiyy8h+W2JOMwkHP4cqI3YGh9KcS/kgACx2pIzoeOSoM3L84bepZtIxI
	 su50iG3rVFGG8HqvyEnyPZvS3vYI00GzXJ76uidjY9Z4Fja4PyR5XMlkYfP123SuTKujJ
	 fJwbVwTvJnuzcQOe1u3aiirEwapcR0fKicNEdYjrzfAtUVIgjAZsvteo/6At9ucwpGI5K
	 8TmDUpi56xmRfsUtWylNlMf7Kxk5rPFxZrSJmt/0TvAtQKx9qEAuNNv3MKiqyGCWN8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=f3+aSODh;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415B606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5415B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=f3+aSODh
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso521033a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795013416; x=1795618216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrwOc17sZXoFCT3tkPfgb8s0Vk7AkFpm4r/CP425i9c=;
        b=f3+aSODhOw2PpRKTgH2Sqv8CDrByoSyNJztnN0Uy/r0hkWHi+zJ/GWTEGOjgSvcevf
         zB/JBkQqgzzDNZ/wFTB7nVcoFcGq8zV9RGR55bDHc+U6osha4UJhIJ8aqfBeReHtw58n
         xpg0HFWiRzPt2Hm8tm3ds0kl5D0nUbpzNLlkxAKfmHcQEOxPiQo+rUSRv5cAZP5STB0y
         ndst44xHWXscP7loa4A9Zl7neCQigzqh4nAv4CyZtzGvBK6cr+H4eXA88OLndeTWm8pp
         N5tV3igcWQg7VP/JqG/D9y9/QxWPkWmmI1LHy/MfSMzyufT8/A3F+in8LUaNqHSZ+0Yp
         VHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013416; x=1795618216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IrwOc17sZXoFCT3tkPfgb8s0Vk7AkFpm4r/CP425i9c=;
        b=lTses1qO5xoFluJ1ziLXQh6amCBe0OgIEjnoN7AXjDjPl65f9U088c7m4+TGQd+CBU
         0GuoGNtfK12FJ8SyV8kz/cn+QIV2FdmOVIjjavHGIaKfV15jQOyYvcu+lVKvByT6N53T
         VmmeSJc8uevXjqi1YU79b9TZNSNWVtmsxOPzTv31y+perIbdbSxAT+zAp0V2++7DORza
         Cz985kBzozdzuUXJdlcobO5qjEpNHc4dN5PIYsn+ohtWAPRiFtyUvsoNjyT+HoQw8yko
         A7Q8xkhUZGtoBpTIDhW2UGxbdnzqlWrkqe0pZHDJaqbCdTzAhS0n6NcbKOljDxtbnrgm
         1tCQ==
X-Forwarded-Encrypted: i=1; AL+hErHIJ8QIdP8JPZsNwXeoRyUrGB13AzrHDCLW8iPDnCC9TQJWHIq6S5/c30gqOm5vEJoSsWKS5wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xeHOf/w/LSzWQdJm+wTh8jEHIdlMDOS7jSpZY1ifJ+ntZBJn1
	RZlmQ+1MKSZAUslnauYCaq40X7d7JDooZcWQ98CyZwMkQ+JFZhkNf/+KtRLoj9+t/Qk=
X-Gm-Gg: AZFdTZfFbiXCxZE0GcmEt8vVyf+fWYZ78bDnkIxlwIEhFylumIjltvJnzCbRuoBlmqZ
	2VSyWQ/F3krOC7h2ipnPufg9/py7WiCRXn0JuBMP2uBIy1PSGxc/n5UeQJejsM1cTOGjl5DcxXc
	ewIPfi9PBGF4fIVWgTkoCBRIcOYqplM5dLsKDH0RpmkQAxJlPrqUXlLns/TNWMPJdBM1BD/vTdK
	sc8sgnO8kut20gi9Y9MTGlT7QJPDT9/QmuQmNbi5dkHLU2ZOueb4qC6BPNmn43O7qVm+PWQD4yB
	kyLg4R+RCrQrPP1iIPTUMTt5h0Y/P+AelSXIYKDFs+h0VPK8ID8lf4TdAddzcslexvn3FJPIlrU
	IFziWSgSrrjd3nFm8ScQeLSu14nTS1b+Qqw/KyPACME0HpdNQHLI1jn4xYEAneeVX3kUuQwLdUn
	i7mvMRco6ulcUJpmzXlQNvFBQSPebBiIqYZkqtuQEUd6KRq6szHQTx40WouToqaUA1/ECYm7Zyz
	tsw/Qp1G/TSRGt35DVqGKQudUC2/66SdQAfjksfuDOPo+Q0miVF7SZgouPQpbBPi2lbt6IAzx5J
	0TJMg+3S2zYZmbXNsNc2d4aP4Py72cJ2dGMJhSrgP3o=
X-Received: by 2002:a17:90a:d60f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b3d063e959mr2846164a91.1.1795013415341;
        Wed, 18 Nov 2026 06:50:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143b9a6sm4765885a91.2.2026.11.18.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:50:14 -0800 (PST)
Date: Wed, 18 Nov 2026 06:50:14 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
Subject: Re: [PATCH net-next 4/6] eth: bnxt_en: explicitly keep device-only
 memory on the device's node
Message-ID: <av27Jl2SSzj5AbXG@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-5-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118023905.3050661-5-kuba@kernel.org>

On Tue, Nov 17, 2026 at 06:39:03PM -0800, Jakub Kicinski wrote:
> Context memory (and the FW crash dump buffer which reuses the same
> helpers) is used by the device, once set up the host only touches it
> on the slow path (diagnostics, FW trace). Pass the device's node to
> bnxt_alloc_ring() rather than NUMA_NO_NODE to make it clear that this
> memory is not meant to follow any queue.
> 
> Ring page tables are only read by the device, annotate their
> allocation so that they stay put once the ring pages start following
> the queue.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Joe Damato <joe@dama.to>
