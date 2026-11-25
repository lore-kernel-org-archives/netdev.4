Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624900;
	b=4hwWqDe019RZqv7IokohrRJg6bp8aBqRyo2PE2VKAr4Wnfg1zAAcnrczPITASbuzceCH
	 FuRNcnfgCrVohuRkYMYidDnZ/ItsEBxz9GC/0YwLsI3vZtA1oWL7Is+H+ZurTz0TjTutJ
	 mdGnb0gXortDBIikX0rxAUZMEOzhuWqqx78Eu0HdEFbT7DkHHTnB4Tf9dcldDhFpBD+lQ
	 GO/As0NoVPp+TOj/ucghiz/jV1heaAupmcHOG7ffk8EhhfkRhilW1a3mpwibwFgA2iOpu
	 r0Ck7SS+Q+fAkZcTAuOwmaA11ypjHb1RGwaWGVeewLF937lsXnaui2trYU8pcrTx5Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624900;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=IdjfLdJimPGqv/1f4+QLlSY9sA6ngGvkbX0Nb5aeWp0=;
	b=NtRWpfnBN155kvpGyp4aOBShu+RcRt0HGf5yS5cSpkDaW/ojt28t/BicAmtRze00jBsP
	 UMLkg1Wot/nsgpMdGHIMKQsdOHaURhXKLuDvpW+jjI83Ciw3zPsl/Nmbpv+nTeEmNFw2+
	 rJA1U74ehCQYCeMbZPM3c7BwZrpZRk4YQBTRAu8UrPm1R1xhQaOcPPIGj3DtL+RuPYOD1
	 /Mkt7Do05wu6QTkef80d/+hlCV9asAKB6FbylT/wMkxOzznHLWWcI0QaB5iSXhSEkTNmA
	 i1chtQhYP/0+IUFWyvfNOoO4UIC8LzMMq+Ri9KztpaDipvVA/B0EydQGWd94IeTuDXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DeQPAi0P;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1045606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1045606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DeQPAi0P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795624898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdjfLdJimPGqv/1f4+QLlSY9sA6ngGvkbX0Nb5aeWp0=;
	b=DeQPAi0PgvQMOPS+ekGJpw6FSVUGhr6Z27UdqjOF1ZrfyL45HbtvlZQZR27LLKG4qFSUuA
	KZcPZHlcWJrtqLHR3zNI5eEvTwEWBld6NpzQL49EPW630VMSB55/KrA4GMmTKZJ34m2pLc
	XbQSzzlGj4EAikP6cOR/ydJIZiV9q0I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-hNXcFcPmN7qy9bm9EoFn4g-1; Wed,
 25 Nov 2026 16:41:36 +0000
X-MC-Unique: hNXcFcPmN7qy9bm9EoFn4g-1
X-Mimecast-MFC-AGG-ID: hNXcFcPmN7qy9bm9EoFn4g_1795624893
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 221811955E96;
	Wed, 25 Nov 2026 16:41:33 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E3CA63001DB3;
	Wed, 25 Nov 2026 16:41:26 +0000 (UTC)
Message-ID: <cbb7e8b0-1418-4120-abf3-f2b2f35cf585@redhat.com>
Date: Wed, 25 Nov 2026 17:41:25 +0100
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
To: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "Nitka, Grzegorz" <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "Oros, Petr" <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261116181612.107a4b57@kernel.org>
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
 <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
 <20261119133851.3f25074c@kernel.org>
 <bdfa88fe-13bb-4050-b750-962586b1d846@redhat.com>
 <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>
 <awMP9Gj3Xhia0ZeI@FV6GYCPJ69>
 <8dc4f480-a875-4118-b5ee-2c4716ee53bc@redhat.com>
 <MW4PR11MB69845212A048D72C99D3AE079B432@MW4PR11MB6984.namprd11.prod.outlook.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <MW4PR11MB69845212A048D72C99D3AE079B432@MW4PR11MB6984.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/25/26 16:56, Kubalewski, Arkadiusz wrote:
>> From: Ivan Vecera <ivecera@redhat.com>
>> Sent: Wednesday, November 25, 2026 3:32 PM
>>
>> [...]
>>
>> I fully agree with you guys... I also don't like the way how the ice
>> implemented pin sharing
> 
> Could you elaborate on that?
> 
> Thank you!
> Arkadiusz

Sure. ice uses the API as it was designed, so this is more about the
model than about the driver. To support E825, two series extended the
core so that ice can plug into the objects of another driver:

- "dpll: Core improvements and ice E825-C SyncE support", which I
   posted myself together with your ice patch, added fwnode
   associations, the notifier chain and the MUX pin type in zl3073x,
   so that ice can register its RCLK pins under a zl3073x input pin.
- "dpll/ice: Add generic DPLL type and full TX reference clock control
   for E825" allowed registering a pin found by fwnode with a DPLL of
   another driver, added the notification source ID and let fwnode
   pins attempt a state change without the capability bit, so that ice
   can register zl3073x output pins with its TXC and TSPLL DPLLs. The
   same series also carried five fixes for the on-pin and notification
   paths.

On GNR-D this leads to:

- A pin-get of a zl3073x output pin runs zl3073x callbacks for the pin
   attributes and ice callbacks for the TXC or TSPLL registration, and
   a notification that ice sends for the SyncE pin runs zl3073x
   callbacks from ice context.
- The zl3073x input has to be of type MUX, although the mux is the CGU
   in the E825. The RCLK pins are registered with the zl3073x DPLLs as
   well, and the ice callbacks get the private data of the zl3073x
   parent pin.
- The same pin reports direction output on the zl3073x DPLLs and input
   on the ice DPLLs, and the properties ice fills for it are never
   used, because the zl3073x pin is.
- ice follows the lifetime of the zl3073x pins with references, the
   notifier and a work item that waits for the ice init and drops the
   ice notifications by the source ID.

The RFC keeps every pin with the driver that created it and describes
the board wiring as a static link between two pins, found through the
same fwnode references. ice gets its own pins for the TXC and TSPLL
inputs, and the CGU RCLK muxes become ice DPLL devices with the port
RCLK pins as inputs, whose outputs are linked to the zl3073x inputs.
No callback then sees an object of another driver, and the special
cases above go away.

Thanks,
Ivan

