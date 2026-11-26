Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688702;
	b=hB4gLT1odjPf2DldWYsTJR21Idex12XaCAVyd/oMUe0ftgpDjNxZPul8nUviUh9HHKJZ
	 e9bAl05jnTTmmkxnUV4uGDI7LHdOtqdzyjxi9WeZ5szpqNuY9fQsMdG9I/gbORzyP6gUU
	 RqU8gavrGdCEKcwZKOTph8+xbvuGYwq9MxZo16YlWKtko5TaxEFs+p4C6Ch/SecgUhLso
	 1DVzME2nd3ITk6BSolA6M+SYAxT9XDik0yVgWzOGJxoj1nZIyeGYvTa9ry9JzXi4PrW5h
	 65gRa5FcWBE3lzlqCbWmb84MVLbuoGjwloznKlKsGCsreCr7VXVtsH8YBsY3/k1Vx4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688702;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=i/JmyauH7l82eFjCFUmPoDEh6XW6u0GxQgMM//ELtmw=;
	b=DKl1TvZh7eDmhS6B9MAd2vWfiiJc1giBl5xEhMguYvV4JxJpe9BgaXVZHwxqdURcK7al
	 66jUQsejV6SrlTvlUWM3cJkbGgm5dJFXGqNf+fmLUv+u9R7o4yLHifl1NoSXj7RrJHsGV
	 0ulhs/Oz3U5nAndc1OczF2bI8ymKcQ1FHuNz19MzPLD9RjzKch54Ha9QaXAKx/vId8xUY
	 OVQ1CJELrRIvPhiZ9VKIepG/v9vSBYXL3w4NZAqSJLdsh00eVTsoJEGWJr3bpb+FGnEWL
	 TvyQEu2Z1r3meyETfDFjeauMWzvPzgJlz0QYW+G9GLjCb7VTV5Upt/5xOG9ZI1Rg9Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h17r5eaX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F5606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h17r5eaX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795688701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/JmyauH7l82eFjCFUmPoDEh6XW6u0GxQgMM//ELtmw=;
	b=h17r5eaX2V9P9lkT4Q6TgqitxpTDzOq43+ogWvlgeb4ni0ThirwWm76OYF0ND+o6ZVuLQV
	uFqh+ECtOu8R0IHRxFYHi9ZyEMYaJ8FcTxaImC16Y7Ju2vkxMIdGdHk0Mt8c3jdtffRlRt
	azpNBzaoTbsbXAAI3etSwPXiXK/864g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-joMpSGu4NCCDf1yU-H18WQ-1; Thu,
 26 Nov 2026 10:24:59 +0000
X-MC-Unique: joMpSGu4NCCDf1yU-H18WQ-1
X-Mimecast-MFC-AGG-ID: joMpSGu4NCCDf1yU-H18WQ_1795688698
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3C2418005BC;
	Thu, 26 Nov 2026 10:24:57 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22EF61956042;
	Thu, 26 Nov 2026 10:24:55 +0000 (UTC)
Message-ID: <4c0862ce-da4a-4da7-8edc-d1faac04a665@redhat.com>
Date: Thu, 26 Nov 2026 11:24:54 +0100
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
Subject: Re: [PATCH iproute2-next 2/3] dpll: add the generic device type
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
 Stephen Hemminger <stephen@networkplumber.org>, Jiri Pirko <jiri@resnulli.us>
References: <20261126090516.4278-1-poros@redhat.com>
 <20261126090516.4278-3-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261126090516.4278-3-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/26/26 10:05, Petr Oros wrote:
> DPLL_TYPE_GENERIC is the kernel device type of DPLL devices that are
> neither PPS nor EEC, and the ice driver registers such devices. The
> uapi header in iproute2 already has the value, but the tool has no name
> for it. Such a device is shown with "type: unknown" and "type generic"
> is refused both as a filter of "dpll device show" and as an argument of
> "dpll device id-get".
> 
> Add the name to the device type helpers, to the man page and to the
> bash completion. The list of device type names used by the two error
> messages moves to a macro, as is already done for the pin types.
> 
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
>   bash-completion/dpll |  4 ++--
>   dpll/dpll.c          | 10 ++++++++--
>   man/man8/dpll.8      |  6 +++---
>   3 files changed, 13 insertions(+), 7 deletions(-)
> 
Reviewed-by: Ivan Vecera <ivecera@redhat.com>

