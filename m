Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795517815;
	b=KdEWFqqrO0LT1v1YcW3Xm6mXY+gJgqcPCjbqL1THcC28eKRspcc2LGRnGHfhuyGfqa5+
	 Ox/kVYUotYHfFGVVZk/HrQL2up9QX9zCyvPfphLQ0lZ4C738O1UjElQcrsPs8+XaJCwKm
	 H/H24VauvIPoKr7ZYnu/rmp5NsneKA7E3yWQWeNmLM0UvltJbZ8XGFtzLMjeAsds+tkxF
	 7VNlRaHgQsqdoijlmlUht0ENE2kJhUd56000UT7UNw+uCyeWBmhKufz/FbwRurWZe9ynN
	 d38ahVNlBnx6ulPy4P26o19WV5wIaLJjpvmw+PrkyH8IYvcd3QG3skMS8V8HHXaeGKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517815;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
	b=Oneu4fLtZ823eAzM1CQetK16Lb/yad3+VTH+A8k+2NCmC1AL8cdZ3dKA4a0osETBfx8w
	 L5EydgQbgT9w1siRTJDYZsCKmP5W6BC4X14c168Nubadc+/4rcl0DNy2WeES0DocmjNgH
	 qGs8SGBDtBsEEX9alHNsyR6jdSsD4x1+DkD1+hhRFihHwe9R0xftL8xScaK7Cb5Heb99k
	 z/fdExJd9qFcTwPDf9mIX8K6Uer/7yYv5CZzDXOzBco/0OYGnIJIjumhksVi2AMNn6Am1
	 56DAy/KVYGEOCkBpJ2iDg7nHiGCGG3CRfbkxAYJjAn3mPHh+F4cX0w07iNUH4VxIHCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jIz2efb7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XCVcePqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25558606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25558606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jIz2efb7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XCVcePqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795517814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
	b=jIz2efb7kfzn3tVsUYgofhmPVjMZK0z8tdr/Rm1ubVtaUqvAJZEF2KEMjuwZh4wDij5k6S
	uY63qfVpQIoaB760fHNmLKiDKC8Ehi8iFmCcR2RbsdyY1F1RhJ1sbgVK0iQimQa4c0PTSs
	dtbT8GoEDeIDQhvEQOw3Ra+eSwt9OGc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-4ibF4pipN0ay6s97uAwjLw-1; Tue, 24 Nov 2026 10:56:52 +0000
X-MC-Unique: 4ibF4pipN0ay6s97uAwjLw-1
X-Mimecast-MFC-AGG-ID: 4ibF4pipN0ay6s97uAwjLw_1795517812
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9211d51dd37so98951176d6.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517811; cv=none;
        d=google.com; s=arc-20260327;
        b=mY6OlZzvIS5SoYDgjLG3Z0rsBhMmdQ/+l+Fle7y53YmwBHCq8PhKPk+vWihw0KjYNP
         eKC1fWpV3XO0phfSuhkbS2cawXYSwmD2y1YhunNS3o3aSDfUqbb+mkwh+VNdkKbBrREL
         F2I1YkC/Du4gL1QM56JsMD9q1gC3KPmJSeaF3CPM619ynAUlhGpV/UT1N5N8cgjZaphj
         uy0E5rWNl0giUAZOEpltg7nCUZ2oYVu2aAOSX2eY7idsp+ek7980lr84OF0qNRjA/3BF
         zAGZo7df+CosdvmUFFH6QRma/0VBaVBxzCxXcmWiJQw+gj3U1OIYLFPHbpmNP4od+Jut
         Smew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
        fh=dystiRtVXnjA/43a71QSAs4qv4Z/QH6/vc5a9iUhWWQ=;
        b=Wv18h2K8m78xI+y5A+Xe0nYxpYQyjZVaI1fPtKAvotYNWJ3p7NqJeJrr/+L8uD8Z/h
         C7taApF129xWjLQzmLYlaxRSHDMdt0Ne0ZQVEfOA3+VTCN2yjB67B+h3s/ilNDGwOGkx
         59M8FjdQpjAiy/V5IK6sq0q80y8qFx/iwS+G+tWvI8zUbkEXTIaX9uL0xRvqyh5O7GWi
         +ZWOolrRz4lKpA8NtiHnGrPWzDMjFnXjZA3ExSo5YrISGw6fHXx3o1PDKbQNf0k2na0I
         2fj74zGC/3YBqYlSSJkti1VzLQQIck9i99BzXCJWDZ/v0kaHo9ydCjvPrsZiOcfam7+G
         4gyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795517811; x=1796122611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
        b=XCVcePqSOUks3iIbGZ00QwC40XUdVxy17wLPAYSX88ePVNfa1iJPCrf0+pYXMtqeR/
         91UhYgkPYMu2o3QBmXuB76LBiV9lmtnIotgwOn2k72zIJLGMuhpqcjXL4bv0E/Eq1w5R
         JRRiRR6pllV76XhOmu3Kosi1OFRyRAHjLUdEUVqenkRib9G1/4mjXvm25fjcx3QrfBvX
         g6xF4sG4qjMxTQNkJG3OrwTPswOLZZQm8sJGN6TYSZ0cRumOgPkIyZ5B3cYF3uz+5D1H
         1f3K/i6ilH9DoTb8SpGnngglJ+xhkAJAPG2iQn6IP1rPLW+vSGmLawvcLsaJd/THVhnh
         NGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517811; x=1796122611;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
        b=FZCVM1srh1h3/XdZCMEuDWjg/Hbvs2OC+o/LhPXBCbyv/0FBBJm0n5Gp/W+X4c4l1m
         rAVNu0Z+h3sRznDozGw5gPbzvnWkphyHLoAOI3I5NR7KdRWqIKYrSgLl6B3dX0LBDHrj
         LZmOdtv6SXNqlIKTfUM8t+Y9Wq/X3MWwdMlAOaytIxdrNCkBk21uC5bwLajdLqx6bX1b
         m7SFevkMZhZKFRO3yaTr/Y8F40Je5dnBS8F9CCxKMW7iA4csE2agdA1LeZ1fiWXVYKLx
         cJzFP6JjBe/+zOxMQZqH/FSzbjYaL+ibMjG9E65ElywaqTGvJ0D6dp5/k77ffp/sysVQ
         W+Iw==
X-Forwarded-Encrypted: i=1; AL+hErEbnYuACeCmj9BEtO8kYigc9nNC+v5c60DaJ/lJXJwzVYOTnLusZkidy0kAtP8QitW9NEtMtxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xk3LaJDKOPuJaS7LFzxqn5HVPruSmeHpheCPhdSZijZatRPEZ
	XReJpML3VsbqnKxvkfJ0Ly/WNOu4/H6OS8sguMdH/dufDBN6SE1WRGmrCHcOZtZ6LwyQxO3I5dr
	V7YaJzkoGrXuqKd5LDonYq4vXxOjwRWzxYY0ks5KfXa5xTtvgyCOggYsHH4tVi/jWiwd7hdnTZZ
	LOCWG8QMrIXXaHXManF1m13+hekaflHvbS
X-Gm-Gg: AZFdTZe9k9pbXPFI58L3jekgfVQRKuOz+E0FIGxtcsRlUza/tz6M5oO48nMOjc/Xovn
	eA6pErA6XYqHV456+B1aQ5XD43807VEHjZSQgzC8rItQi0rofeoiDg/TITWBy8dj3FLE19CBjL8
	M3sSOaWrbnpjzFIF8D/4ybvx6KGpnDy6p9kupooP90u/V586HFyPfX3Fo=
X-Received: by 2002:a05:6214:226d:b0:921:37ed:5d0 with SMTP id 6a1803df08f44-92137ed0715mr242412936d6.48.1795517811527;
        Tue, 24 Nov 2026 02:56:51 -0800 (PST)
X-Received: by 2002:a05:6214:226d:b0:921:37ed:5d0 with SMTP id
 6a1803df08f44-92137ed0715mr242412426d6.48.1795517811018; Tue, 24 Nov 2026
 02:56:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 04:56:49 -0600
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20261120174540.37d152de@kernel.org>
References: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com> <20261120174540.37d152de@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 04:56:49 -0600
X-Gm-Features: Aa3M54oXKMFlMM1Oml5R3p9TM3DnPWFPNqxfUYAgRUMjL9U7VfA3l26fuKvgEVA
Message-ID: <CAAiTLFVC-oxH-7N=FOCdVNcJEEVMU7WFV_k5t+g51Ce3ZdrO-Q@mail.gmail.com>
Subject: Re: [PATCH v2] vsock/vmci: reject datagram binds in local network namespaces
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Jakub Kicinski <kuba@kernel.org> writes:

> On Tue, 17 Nov 2026 20:01:52 +0100 Sergio Lopez wrote:
>> VMCI already rejects datagram sends from local network namespaces, but a
>> datagram bind still creates a receive handle in VMCI's global port space.
>> A VMCI sender outside the namespace can therefore deliver to the local
>> socket. Its handle also prevents a global-namespace socket from binding
>> the same port.
>
> Looks like someone (silently) applied v1 :(
> 00f445721c7f ("vsock/vmci: reject datagram binds in local network namespaces")
> Could you send an incremental fix?

Is it worth it? The change between v1 and v2 is merely aesthetic.

Thanks,
Sergio.

