Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696275;
	b=FHfhCDYl8ADVKgsE+vDQFORVAVajQc3Hr/el4XzUtR1Mj+S0gVDYGbTaBsZZVirc3ly6
	 VMs3Pg8iGmEVP+PVJZuwO3pW80AS6ZvQGe0a6wrfF5mW4evgV2S9CZdTvhksEmQngQDjE
	 Z8VfXHs0xZW4XkCHKXRz5SRxx5vFuNRaAeL31K/zUUAwBlXfiOfQwrlTnmev+1dN9JONQ
	 X3/v5qGkAfyatOi2jqQeTeUPuTJGQXv0mDHXBvfzWwQHg1JWUcK9NwDbLWuMV5R7Y73pm
	 NeI2NY1gtlkQ/m3Vq7c1rANXuMH/0X/SKzKClwWEnKEFaRbhA4n8T37BsPV3pa8NnrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696275;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=52jyvJaZ8hBgfbTK0xHbCFQ/dKRjm1IOosfZ4MG6L2g=;
	b=JnRMF0fSg10yIzRY4LlwIkacX8oQBUTm94qrvb57orVM7dua6FgmiAN1l2nXeHoEg1hT
	 ZQzk/6IJ6/ogkJIeW7QIasASa/ky5KG5YM289YqWg4Rs9LH6EeM84ns7czj/DrXGEeBwV
	 NrJ7OlkF1MbnubSYTJHpIZEaDXhaDg0I8d5UqleeE9cshR/asQ3rHaZmMNyrWPexRlWSg
	 rz+00tDyj+HiEty5y7B18a5+nhioeVADF7n8HfybkpUnJA53zCUxPsmsDAXN8VhjB125o
	 I9eXxJyNQ4t80Bq1Ect92lL4Kl1oSWpLQb1vmUsQH8ovvonrYUJiuXOxEDTkll66axQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GrEcHm5A;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422DA606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422DA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GrEcHm5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jyvJaZ8hBgfbTK0xHbCFQ/dKRjm1IOosfZ4MG6L2g=;
	b=GrEcHm5AfaTg0+uHOwjL4dBwmFjOlqVrQODkxgdgTVr25H+cbLkrviibEAW8RR8g7q5ixl
	L8UOiCaAjPITV3QhdB72LIiAB6ZBSJgpVsVUmh3BT1t1lr7p7KUDRkc8zFGZy9kIw96nO0
	kkI+3lRB6CO0o8q1qc9UpwkLDvG+XDs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-Fw_Z4OWMPFyLuRjexsHCGA-1; Thu,
 26 Nov 2026 12:31:09 +0000
X-MC-Unique: Fw_Z4OWMPFyLuRjexsHCGA-1
X-Mimecast-MFC-AGG-ID: Fw_Z4OWMPFyLuRjexsHCGA_1795696266
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79D031800343;
	Thu, 26 Nov 2026 12:31:05 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 921EE195608C;
	Thu, 26 Nov 2026 12:30:58 +0000 (UTC)
Message-ID: <851d61dc-7416-4b3f-85e7-8a30bc19fab8@redhat.com>
Date: Thu, 26 Nov 2026 13:30:57 +0100
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
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
To: David Laight <david.laight.linux@gmail.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Petr Oros <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261126091510.7ac67b35@pumpkin>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261126091510.7ac67b35@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/26/26 10:15, David Laight wrote:
> On Wed, 11 Nov 2026 17:40:11 +0100
> Ivan Vecera <ivecera@redhat.com> wrote:
> 
>> dpll_lock protects topology and object lifetime, but it also serializes
>> all driver callbacks in the system, so one slow device stalls every other
>> DPLL device, whichever driver it belongs to. mlx5 callbacks issue firmware
>> commands with a 60 s default timeout, and zl3073x callbacks can wait
>> seconds on a driver lock held across ToD writes and phase steps.
>>
>> Make dpll_lock an rwsem for topology and lifetime and add a mutex per
>> domain for callbacks. A domain is all objects created with one (module,
>> clock_id), in practice one chip or card, so channels of one chip stay
>> serialized as drivers expect, and they still block each other. Device
>> callbacks run under the domain of the device, pin callbacks under the
>> domain of the pin, whichever driver registered them. Only one domain lock
>> is ever held, so domains have no lock order. A lock per device would not
>> work, because pins are N:M with devices and callbacks notify sibling
>> channels.
>>
>> The driver API does not change, but a callback can now notify only
>> objects of its own domain. Patch 1 changes the one in-tree callback that
>> does not follow this.
>>
>> Registrations across domains exist in the tree only on E825, where ice
>> registers fwnode pins of an external DPLL with its TXC and TSPLL DPLLs.
>> These callbacks are no longer serialized with TXC and TSPLL, they rely on
>> pf->dplls.lock, and requests about these pins wait while the external
>> DPLL is busy. Intel folks, please check that this is fine.
> 
> Isn't the big problem with callbacks handling deregistration?
> With a global lock there isn't a problem.
> But as soon as you do anything else you have to have very explicit
> rules to safely deregister a callback without either a UAF or an ABBA
> locking issue.
> 
> I don't see this being mentioned.
> 
> David
The cover only says that dpll_lock keeps protecting the object
lifetime, the details are in patches 4 and 9.

All unregister functions take dpll_lock for write. Netlink requests,
dumps and notifications hold it for read for their whole duration,
including the callbacks. So dpll_device_unregister(),
dpll_pin_unregister() and dpll_pin_on_pin_unregister() wait until the
running callbacks finish, and no new one can start, because objects
are looked up under the read lock. Once they return, the ops and the
private data of that registration are not used anymore. This is the
same as posix_clock_unregister() taking the rwsem of the clock for
write. A KUnit test in patch 5 checks that a function taking dpll_lock
for write waits for a running callback.

For ABBA the rules are the same as with the mutex today: a driver must
not call a function that takes dpll_lock, including the unregister
functions, while holding a lock that its callbacks take, and a
callback must not call one at all. Patch 9 documents both, and lockdep
reports a violation.

Thanks,
Ivan

