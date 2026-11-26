Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688740;
	b=pdcUXow3ZPsVkMUb98SxryDYRcTFucoTjFtuaixX7XxeAf5tEjNqK1+ijl9MHgNUr/09
	 6Hl/JKW6urCIsIA4a7rEGW+0X6yq7H1FvuNqXTi5evEADSCYMiCWVSDUncdhLmcn5vILs
	 F0XG4ZJilwjFPeK1jJoJN/Kk6mIByqTCaK4Pex38aUNlV6BbE0VVkE7zTazxx1RV5ks7y
	 dxwwbJiJFSRI/6FMc47fCDNzGWsGRRAKjCKRHfpgMf2UfWkt1WVPOsvXZeHA0gmQ2z9hH
	 wPlrVszAL6JUCa+xVMSa+hawJF82ppEq2/40vkTuc+25DwaN7qYIlQVuQ+v90cShqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688740;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=6MOhfiRiWFI9U9OKo5FxYfiEJU8tQ9k4GVSYVdJ9QJ8=;
	b=l3jFpYfoGk4y0ZA985aScWfxfMG5ygIW/hB1KGMfK7X54B0o2PS1A1hA6791pASP7BQS
	 LN/S2rIM/cpqYjmb8DWa+2Gq16qdsJEBVhQHZ2hT2VujrCynAPQl6/vRF3ez28rKYDw+I
	 rfCpyasQ7I+q2/xo3SPfi9TUrhGf3WePaI0didrLvO6KWcYgHUavoY5Z9NDcK5A1dOK4Y
	 FRymtKONcXQzt6Cip7v5Wl3J19LT9gzW06JGQe8hTnck4HqjkHh7XGrW/7v2OLpyxp5MT
	 s15hNWGBdsQInAYyAWJtu+GamSTZ49FInmqmk4DG/nKY8KK06zRGvJyxjqOjcM49lRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="L4O/EgbD";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE6606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L4O/EgbD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795688738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MOhfiRiWFI9U9OKo5FxYfiEJU8tQ9k4GVSYVdJ9QJ8=;
	b=L4O/EgbDET6t+WpyQ+sgPFYgscTThH7XAzIXVY2ATKthtfTNUzg2GqJ/I9hRAuC8pP/1v0
	eM3zzzE8efQqT1e8Sx147BHvTwg74lhTsWHS6NjL3OELddKbZIkKia3rSCKIyErjyFgGdt
	xcftF5BJ7SLqQ3a3oMXJmw7UFWFt95I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-tZsx8CIfPtGT_RD7tx4bfA-1; Thu,
 26 Nov 2026 10:25:34 +0000
X-MC-Unique: tZsx8CIfPtGT_RD7tx4bfA-1
X-Mimecast-MFC-AGG-ID: tZsx8CIfPtGT_RD7tx4bfA_1795688733
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3BCE919560BF;
	Thu, 26 Nov 2026 10:25:33 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B684118004FC;
	Thu, 26 Nov 2026 10:25:31 +0000 (UTC)
Message-ID: <113b1ce8-08d3-4db6-be81-bee9e9a1a22a@redhat.com>
Date: Thu, 26 Nov 2026 11:25:30 +0100
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
Subject: Re: [PATCH iproute2-next 3/3] dpll: add the state-connected-override
 pin capability
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
 Stephen Hemminger <stephen@networkplumber.org>, Jiri Pirko <jiri@resnulli.us>
References: <20261126090516.4278-1-poros@redhat.com>
 <20261126090516.4278-4-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261126090516.4278-4-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/26/26 10:05, Petr Oros wrote:
> DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE is the kernel capability
> of pins that can be set to the connected state while their parent
> device is in automatic mode. The uapi header in iproute2 already has
> the flag, but the tool does not know it. A pin with the flag is shown
> as "capabilities: 0xc state-can-change" with no name for the new bit,
> and the JSON capabilities array leaves it out.
> 
> Add the name to the text and JSON output and describe the capability
> in the man page.
> 
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
>   dpll/dpll.c     |  4 ++++
>   man/man8/dpll.8 | 10 +++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
Reviewed-by: Ivan Vecera <ivecera@redhat.com>

