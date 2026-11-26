Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688675;
	b=GcDl4vH5M9TgFy3o18JJR1UeY/2iDWDyneNJ1QyC7f3rgblq8WkLW5wHyCq+55ADBfYz
	 JLR/DIB8pUwcIvg/kyNrjwAn0/JFUQTO0OMim3o3s8hCATLKK8pCjy8WvI+jI6TQ6to1L
	 BBswhybUbeq3bArPUQ9DKuCcKNbVsrQexN4iqdjKsaWgMbaRFEEDxCk6ZhUat4MtD0jTc
	 TaLjY5w3QyRfqK7hfK8gZQrl2czptbbv/nFwKilh99axqhWl8Ta/WQV0eD7UQHsIj2Kdh
	 pjSSVHYrmZ8OY1NnI8VlK+O+DRa1rToKt3P3ktdqrnbx/1g2XQCp00n5SvY9PswCGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688675;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=DGacvyZMdRcGn5aUnHhAEjCOe4LYBWc3FSAHE+DL4EQ=;
	b=z/FIVesRKCj+946e5pXgb0osU+u+lkJw0e2PWpHdublPYp6JWlsC0ofeLORVDs9cs9gm
	 TZ8pnzy8u39WnI2F/QWwM8PcHqqAHWvBlF6X9rzPTS3NCsTYlkMQbY+9e8Xgl6KIig1y/
	 asUPX6Os2IRJI37XHVYRxQq6d3ZFJNktE5Jx2ObCet3IZQ3R6+qMo4JCK0JF/SHFw226T
	 TVnN9Q4Cvpb+ceg0GaOhUFyopyZ0wH/eaepq2XDWFYKm68OjZDVQ3stoFGdur8pJqdtiN
	 iS8In0EUA9a7+kuFA8TqnoA9z8xbUC3RzFR+P0OPPiw7+n5XCA+lEJkoy8WuKvDsVaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JLrGMQIm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA18606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA18606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JLrGMQIm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795688673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGacvyZMdRcGn5aUnHhAEjCOe4LYBWc3FSAHE+DL4EQ=;
	b=JLrGMQImfQskgkPCSKZA2LzeslA3KBHR9CRn6B5EFB3onQDDf+/UomyHdDAot0dwnvpoND
	xymZuMK4Fb9yulDxmkRCudD4M5B/ZFQ+SBHRoIIyMksnw9PtnR4FmpuuwLH9FoUaDPEphY
	bWrM+rFFU6qucp8E8ao08RuANMfrmo8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-rLjbbOrSObKKQPVcIDWdFQ-1; Thu,
 26 Nov 2026 10:24:29 +0000
X-MC-Unique: rLjbbOrSObKKQPVcIDWdFQ-1
X-Mimecast-MFC-AGG-ID: rLjbbOrSObKKQPVcIDWdFQ_1795688668
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD6E6180054E;
	Thu, 26 Nov 2026 10:24:26 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 072FA345;
	Thu, 26 Nov 2026 10:24:24 +0000 (UTC)
Message-ID: <366e7ae4-6fbf-4855-a544-097e4acbc21b@redhat.com>
Date: Thu, 26 Nov 2026 11:24:23 +0100
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
Subject: Re: [PATCH iproute2-next 1/3] dpll: add the int-nco pin type
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
 Stephen Hemminger <stephen@networkplumber.org>, Jiri Pirko <jiri@resnulli.us>
References: <20261126090516.4278-1-poros@redhat.com>
 <20261126090516.4278-2-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261126090516.4278-2-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/26/26 10:05, Petr Oros wrote:
> DPLL_PIN_TYPE_INT_NCO is the kernel pin type of the virtual pin that
> represents the NCO mode of a DPLL, and the zl3073x driver registers such
> a pin. The uapi header in iproute2 already has the value, but the tool
> has no name for it. The pin is shown with "type: unknown" and "type
> int-nco" is refused both as a filter of "dpll pin show" and as an
> argument of "dpll pin id-get".
> 
> Add the name to the pin type map, to the man page and to the bash
> completion. The list of type names used by the two error messages moves
> to a macro, so that it is kept in one place and the lines that print it
> stay within 100 columns.
> 
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
>   bash-completion/dpll | 4 ++--
>   dpll/dpll.c          | 8 +++++---
>   man/man8/dpll.8      | 6 +++---
>   3 files changed, 10 insertions(+), 8 deletions(-)
> 
Reviewed-by: Ivan Vecera <ivecera@redhat.com>

