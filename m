Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042797;
	b=j3vXqDRXUR6mfwDHc7emDfRgt1tSeUl2umegH7V1xsORhI2joWrWkFcVK097uQtMXX4N
	 vGP03PtL+94ikwoE3WAh+7Ap2zqQqEhZrfqF9/imsk2oMR+GSORaFZePI1lsZAQR++gaA
	 H/0YvWcnxUVR539Zyq3ZK3P2tHhXInPsrWgx20Qovhu88U4Izdch/ehhWWYcBu6x/kfV6
	 86ClIiS+d7zvIPIhE84Eny06PyyHNJPZjs/bTrFuq1nZjZb7DEyyB9H+41PLR4cvsquqd
	 tCWoJiTv1FsFEao1moOFZC/31hqLglrGs+nsdJCbpvwGLRtNkk2RQlstiTHtTDbJNhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042797;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pu6u/8eyH2kLDhT1Tg3T+SNqX5WUYw6LDyYNcpufSMQ=;
	b=muDyarmfHCHx0XQohsjID+CON7+qNKukQ4TbgbxrvTPam7du9g2PZee/oBmNgkriAQTQ
	 bT1t26OmQfNeXlo7mnOI6XzT9IJf6nnlUTwWKoPXu8Sk1Fl4zayhi9ejDLYVNvJYr+wQZ
	 I/FiElUCnX60RANuo01bFYUXnyUFPQ99M8KO2FTHhv/AepGekcoiXAjkmqoSpYK1nvjnO
	 VlXHHl+6QAmL0aXWS0/yiny17dK5n+dGZIWGJNb7uG6GDSt9OerDv7yAlc454CAdlWVnZ
	 iwqfjYJLzHZF58722PUol9Seo6AIe5EqHGKRiPvEWbH8SgLqfjxgK52EqaTaQEE9EYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/prskdT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B057B606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/prskdT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673651F000C4;
	Wed, 18 Nov 2026 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042797;
	bh=pu6u/8eyH2kLDhT1Tg3T+SNqX5WUYw6LDyYNcpufSMQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=L/prskdTt7EMxb1v1wQtFmSyyPRDt4w0PquGM1UNur/gt6LGxCD2ZFxHXLHhzWvs5
	 C1atdLoFCgK17aqnlqe8X42I7kwbHHI58o7DmqIPRM6OmYUBtQtWiRsP7Mz7AT7b5T
	 u5vG9/4CZVJTlnhO5k4G0iO58BD3YqWz++n6TfZ2TN9lwGa1LoNqe2ra7n16ML/g2x
	 3slqxnEG8rEO2r7Qok6Ae5M9fnZOeJ5+FhQKynIdghqaihVqKPzaUEqjm73H29tKXV
	 ycBViqfIXc2X1e2aqoP5+TXsoYHe99zq/Zpqwv2Sga+KY4AMqKcFhrxUroSB8SYpK5
	 cau2vtVU/JwkA==
Message-ID: <ce450062-7a21-4b4e-b96d-06c12cc629cb@kernel.org>
Date: Wed, 18 Nov 2026 15:59:57 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iproute2-next v2] arpd: remove
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
References: <20261108203417.1207407-1-stephen@networkplumber.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261108203417.1207407-1-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/26 2:33 PM, Stephen Hemminger wrote:
> arpd, the userspace ARP daemon, passed away quietly in misc/.
> Born last century to Alexey Kuznetsov, it spent its youth answering kernel
> neighbour solicitations for networks too large for the in-kernel table,
> keeping its memories in a Berkeley DB file. In its final years its only
> visitors were tree-wide cleanups, who stopped by to add an SPDX tag and
> fix its whitespace. It outlived the problem it was built to solve, as
> neighbour tables grew up and learned to take care of themselves.
> 
> arpd was predeceased by its lifelong companion libdb, which Fedora has
> already laid to rest; Debian is making arrangements. Unable to build
> without it, arpd chose to go with dignity rather than be kept alive on
> a bundled copy. It is survived by ip neigh, which does the job without
> a database. In lieu of flowers, please drop libdb from your build
> dependencies.
> 
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> ---
> v2 - claude review found some more dead bits to remove
> 
>  Makefile        |   5 -
>  README          |  11 +-
>  configure       |  23 --
>  man/man8/arpd.8 |  69 ----
>  misc/.gitignore |   1 -
>  misc/Makefile   |   7 -
>  misc/arpd.c     | 841 ------------------------------------------------
>  7 files changed, 2 insertions(+), 955 deletions(-)
>  delete mode 100644 man/man8/arpd.8
>  delete mode 100644 misc/arpd.c
> 

applied to iproute2-next

