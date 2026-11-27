Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786811;
	b=hP0hN2DQyI3pGSXblqKroaEE3FlGSGYURw4TT7rdqGmW2JDvcWalL/M/jgiB7y8XC39H
	 5tsNwVxmJb+eLkHiW1Wf22vIhnzWaUvTfjwWPgGze6oGgpDM+jJX7C84mi+OBwuupZNFI
	 KT+0kecR7xHHFxj19ok94rLrBYUJDD+mjJsvz3NjZ1gKNIXI5TCZUKi8oE8A/pBUsShJ3
	 PDbKyOlhin6Y+SlCkLLk1nlVd3QlnHOWuOJESH/NLU8fYsqsmad2AusrECie5/cHOZNpS
	 sayuYIH64gjmLX3ZO9LCOgWvrTSAGRzQT++Lqu59gkqLa+hMAuj1NhGzJQ9dZZFiopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786811;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=D/BFyojwH8uW2gTjODdP45TT4XczkirDrns9OGOr3Ho=;
	b=uFEe17qVoVt4Q9WUSGOWSqPl11Jmlnsd/3MZhTNIcQ6bJ+QZY/n+o4HvRTJWQqPQQPrm
	 vLS6ELKJMAoLuAcaC7CR6Fe6iZUEra4OlLpiRy3qxSAJD90u90mBwqJMT0uHLaIaAV3v/
	 o+RRQ4R+7aPNzF8RCkZYAMi0neYSlk6LkizhIo4IspSLt7yMoDt/oRw/ik0sR6uD52LvP
	 JqqYCBKUud0QFoQj78kpUs2imxzwv+j2O+/U9hLajU5rENYucxLGrv4v3e309JbTCMesZ
	 W1AweytdrX0EHTiAndq+YpGo6/c+desojHGqcgdGq+qnNbWux7z2zi0eR1+Zq6CVykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bEYJdZIf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84C606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E84C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bEYJdZIf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/BFyojwH8uW2gTjODdP45TT4XczkirDrns9OGOr3Ho=;
	b=bEYJdZIf+19w1VL/wOVSPDimH7NlD0YNeASU5fp0M9Z0KB9g6A2aZeYX/ALv5w4G2DqejT
	8aRUp0fbxGVhta3iORcQNVyNcGWVyouq8ivkhsKK/2/PzQXcs74NmJmEekri35WDUQdNo3
	MwT541LlPJoip0SVKqzkwV0Wd9lYW74=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-4I1DoUC8N1akkwr8jRO8rA-1; Fri,
 27 Nov 2026 13:40:04 +0000
X-MC-Unique: 4I1DoUC8N1akkwr8jRO8rA-1
X-Mimecast-MFC-AGG-ID: 4I1DoUC8N1akkwr8jRO8rA_1795786802
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC088195604C;
	Fri, 27 Nov 2026 13:40:01 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A3571956042;
	Fri, 27 Nov 2026 13:39:57 +0000 (UTC)
Message-ID: <0d89beb1-a997-48b7-aa85-201caf3860f7@redhat.com>
Date: Fri, 27 Nov 2026 14:39:56 +0100
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
Subject: Re: [PATCH net-next v5 07/14] dpll: dpllsim: Add support to get/set
 priority on input pins
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261125090522.3777494-1-poros@redhat.com>
 <20261125090522.3777494-8-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261125090522.3777494-8-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/25/26 10:05, Petr Oros wrote:
> Add support for getting and setting the priority of input pins.
> Implement the prio_get and prio_set callbacks and advertise the
> priority-can-change capability for input pins, which includes the MUX
> type pins since those are always inputs.
> 
> The initial priority of a pin is configured through a new prio attribute
> of the pin directory, which takes a value between 0 and 255 and defaults
> to 128, so that a test can lay out the reference order before the device
> goes live. Like the other pin attributes it is writable only while the
> device is not live. Priority changes made over netlink are stored and
> reported back, the driver does not select a reference by them. They are
> kept apart from the configured value, so that every live transition
> starts from what configfs holds, the way the pin state starts from
> disconnected, and the attribute keeps showing what was configured. The
> setter rejects a value above 255 with EINVAL and an extack message. A
> priority is meaningful for input pins only, so live fails with EINVAL
> when an output pin was given a priority other than the default, next to
> the frequency validation.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

