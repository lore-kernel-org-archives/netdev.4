Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795722034;
	b=yWaPRZqaSVtcJxPD25QieYxLnukTPS/5G10VuB2e3SzN/P3SjbIYW07sylxv8SdHkID1
	 ILaUiM/znYDtzHMmjLqQCd9rb5D0X57/lvnRCPGQiE5zHMolqMd3KAv9A0nWZl/cLzdrD
	 29wBtXeETvFpQ/JL4pju8H7jwcKOdHx7mYhAVpRJN8zfPXqOTE/3mI4DlU2DWIDsA9ZyV
	 1UZAyNJBb1DmEZ1vwVY2uSLAT5/WwtFl0jXn5/GGdFECWB15V2vMgl9Y806UsolLuGUhc
	 h9FClm7JKjW8tigIg4aJPpkJSkWoLEwsdcr1bGJMHV6O9PYk/Rylo9jDADWdin9fovg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722034;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
	b=uyQ7F/ViThbPLDZCMY3axPdLyFLzkBOpD6ZFF3f/reWD4ilp6o1yEi85/jdhJ4Gj/Jgw
	 elX7/g+KwS5DPEXzIJFbnaEXgs1xk6G7Z7ykMo4b/pzecm5U1uxTiDp7XNGKni+zoY0Oo
	 0H+FoKOOOXtpa+FqXTa9CqxkR4bSq3ppqCSoXbzoNvfwSJBgNJ+V5iHzgviCur2epa64a
	 I1Vx4HsR9Lhl6KyTNz5hW86ffl4gMuRzXUedV2A7yLZ8Gl2w5b6MjDkViICulLrWGHl+r
	 R61bmjaAQqFszfAa5EPm68tqJYeT3/SrjK57KBhognhDYo5AxzvjfzpuwyR+/zF3/Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GBbBFc4p;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="gOkql4h/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F51606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F51606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GBbBFc4p;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gOkql4h/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795722033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
	b=GBbBFc4puIaE5uA9MZkzi+LBO5si4N1Fv8Faib0PqC3WU0nQZn7HV2hUcnHvq2hc/LxC2+
	573xL435slSrlj610itMfcXuMvrPaZI4Y9Yj3YzN8v557gJatb7l7delhvbVyVgWgCWmOK
	I8wbpqtElmz+XFhKw712LIJnoHij1x8=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-9uIIoFQEOBiE4IYsGBOW9g-1; Thu, 26 Nov 2026 19:40:29 +0000
X-MC-Unique: 9uIIoFQEOBiE4IYsGBOW9g-1
X-Mimecast-MFC-AGG-ID: 9uIIoFQEOBiE4IYsGBOW9g_1795722028
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386ad819860so5393154eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795722028; cv=none;
        d=google.com; s=arc-20260327;
        b=OG+aICqjT7tDo31p+4fopjOTrb0c3BRBMMRwcr8m7Zl5xh1Tt0exm1rZXylZXU/DZY
         T3wEcO5PQF23A+5RNqHyqTprUzMZxABpPTBdK5SKoMSGBJn0Ec3b/2gBlH42UOuAUWc7
         4fQRUO2o9LZMhBleS0Vy2C6ao2seChXy3NbevmoDnAY3/XU7qyQmyppdcay2jAd7ShdY
         mvgofYi+pgp9yh8FvSJR6wgwVjxIVxuoaagiZt8uY7QfqdtRVYa/CeBQ9lufrArI/uoc
         BFDclr3x1Qexr2mVCmsRFJgFQ064eHxiMnIxMncEyptCPivfJAmEZyYxbSro0XC8jAHI
         8Jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
        fh=Y+TqXjxGANYhzF9dqkvxD2DVqlZ3Y3OGcJ6KEV+qDw4=;
        b=O6dsy8FF/5jk0JGj/S44GBaeG3cmGp6RuD+PDON2nkPSw0occWQCO/6B+2M/2y3uwn
         0tBU+PzFHh2w08oSpHDVB5cD+sT+Zv7uYAC4QL3I3tYmlEEEXikGLzCvT4SQifcDQsjZ
         yq9F2R0Xy7VfReEy/jv4vvxfLwWaVxQudAsLAEimg/LECBwC8UpwIkYz3RuQic6qXDkO
         rWiUPhIDJ/6X2NdmsotMnzcpwrzl7sAlxaHJJ88lsx3qEkPgrkW7ouGV1V6Z3MUvj4R7
         EBDFrWBaL4AKdLjbH1MXNxEr5PIDsIQK4YZb7NzMi0abXMK6Osah86a9jKfen+dRaMd3
         WaTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795722028; x=1796326828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
        b=gOkql4h/Mdmdaf9ZKrDZtT0Kd//Tb20W7FJNUoig5fnab2TcBgwMknFEX1uBpozlsY
         8ORSoBbvVSDcedOCVzbHpZWORybezRnREo10VBkrZpCOvFTyAhWWVJpP/fpCZ4v1Xbt5
         TfiG3mVp6Hv0FBoqK8PfYmif7Yq1LhldpA6g6O7WovDllIoj9DkZpQ59lLTD2T9qCTeh
         BCjc5DqBvcdboKxIicPoB6okcSh6IN8rCItHtQmUMPTS1rPZ3v1Ec2FH+oujN+24uCUH
         yXAmWlRGgkV80GK9SH6DxwHQ1zYg11wdj/YZErjcuh4FXu8ShQjHII8ojqOpzyioQiJ8
         9njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722028; x=1796326828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1JALepU7GR/x3bHR/X22ZryxO1IhoAlF/ZwBjVERkc=;
        b=yCJLpmevyYfIAhtueZemNUs/ZLiiK0kXNSXxywFU9gfoIZjRqJeIsoIQg6KAXoX4s5
         h0mDxzpPxWm5NQnFkBHGwtlUBIHz3mIbnx6lKodK3i2pYfjF0LCmx8u/VWxYLf9cpEMK
         hxr/QveOqVQrm09lCJcyHCJ0uYZbS0at4q5x0Xmvb1zBEjs3+bRD+qHcr7vNARZyXYG9
         50Mj0lB3570srbBkGtyeT1hwJaTags9RNcyLLpYQUfVXohinetIYpsN1pxiLOJNU5/WG
         2l37mJJXl1QSKtBan47qY5vddmhUEX5ccvUvUzS7z+JX6TAbjZg6rsaj0nj+yYBFBQOk
         tp1Q==
X-Forwarded-Encrypted: i=1; AL+hErFQ2f4FhzzkC/8m5azxZuKNTv6jvd/dUlZnHYl5SWNwcUIHDVSr0oAgyPVLN1DTVz4oLCqxRGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JfLVpjJxuqwWoW7x4h+osRig/9t02DY0Y1A8UhZneQzo8EVpb
	PxWhSE2pDO0Uk1jdAez/A4+NnCmMiXSdaO7au9u50AQzBoalORHR3nLPqu6tWYS5PxH+/x8s6MR
	waZ4TEKzb+nqtMxeYOP5pqUek6F8omZEKIbbh7qKuSzhYt14v4cu/3GGGF+IFP7TMa4zj4FgYd4
	F9kFpXHuoBRIsz7xYu4d1v6gIp5O6J6Kpc
X-Gm-Gg: AZFdTZd3htWXakGfY8T/vIExEsodSqvy5FKHgBUBw3L/Zt3pFZyYbXPYzhUr91TYlDb
	ET80sA4hfNgRqA5q1H49YBf8bY5X5G4AmfeyQwSSZFcR532pf1XZQ+iU88C28Ozdkr25Ww4p53p
	I9m9JaQ7cN69gyKW9WczM1C3g/YB+nHfARGItX8QtkGaFX1Y9Ar8oCD7Wt
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id 5a478bee46e88-385ce953221mr20846989eec.30.1795722027771;
        Thu, 26 Nov 2026 11:40:27 -0800 (PST)
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id
 5a478bee46e88-385ce953221mr20846969eec.30.1795722027291; Thu, 26 Nov 2026
 11:40:27 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124074531.1701179-1-rc4d5a@protonmail.com>
In-Reply-To: <20261124074531.1701179-1-rc4d5a@protonmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 26 Nov 2026 14:40:15 -0500
X-Gm-Features: Aa3M54pUS8i_NVj6S1gEviSRlU_cYUkcIfq1IIhW5z8VzPWDIC2T6EQTZPDGXFY
Message-ID: <CAK-6q+jR1fZh6PcMKPpQwFW-89GLw6eSuUkC-kCLg+sghO3RpA@mail.gmail.com>
Subject: Re: [PATCH net v5] ieee802154: 6lowpan: validate fragment offset
 against datagram size
To: Ryan Prinz <rc4d5a@protonmail.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2026 at 2:46=E2=80=AFAM Ryan Prinz <rc4d5a@protonmail.com> =
wrote:
>
> A 6LoWPAN fragment carries the datagram's total size (d_size) and its
> own offset within it. lowpan_frag_queue() never checks that the
> offset, or offset plus length, fits inside d_size, and never rejects
> an empty fragment.
>
> A datagram is considered complete once enough bytes have been counted
> (fq->q.meat) toward d_size, regardless of whether those bytes actually
> form a contiguous range. So an out-of-range or empty fragment's length
> still counts toward completion, even though it doesn't belong anywhere
> in the datagram.
>
> IPv6's ip6_frag_queue() already bounds each fragment's end against
> IPV6_MAXPLEN and rejects zero-length fragments; 6LoWPAN had no
> equivalent checks.

There is a check [0] to reject d_size above IPV6_MIN_MTU (max ipv6
ressambled packet size), so checking if the offset is in d_size should
be fine and we have something equivalent here.

>
> Fixed by rejecting any fragment that is empty, or whose offset (or
> offset + length) exceeds d_size.
>
> Fixes: 7240cdec60b1 ("6lowpan: handling 6lowpan fragmentation via inet_fr=
ag api")
> Signed-off-by: Ryan Prinz <rc4d5a@protonmail.com>

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks!

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/net/ieee802154/6lowpan/reassembly.c?h=3Dv7.4-rc4#n302

