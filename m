Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786839;
	b=gQtTqTgQiQY4PT1HgCp97x9L6Zr75TgW1OTE9dywDAtJ+/H54YT1rkh4oQ9b1Re69ig5
	 4fEvTRxO3vzToEIjOMnSO2INDFl55kUB0gzrwmbrycor6B4cjpFacppQigOdjXrw+TY80
	 VoxEJJQ3Pan+rhuK2P6OUYXCc7ZFpyLOKZScZ6D9AsgtCu6R0yWr/GuJ4nLIMNpPVPlWC
	 e8S7Flux8WrxsrLRH0mQLJfBItKg9Z+uA0xgCj0WasUR5w9gH13lx0F+QaPPiJggtAybh
	 iMnWZkY9r3icidiElXbeHJUAhMWHHrePK/nKo6hfql176VTpAriBFhqX3IqabEWf1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786839;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=+++htzLaVrGkvQnjm1karEJsL1q5AA/35ff8G5m2bmg=;
	b=sB3n/9fTXxEscgVo3QrCpvAGZZHvDIURb5T2MZogN2t/BMKQ+AycX83XDB7DFB7DQ1I6
	 rmealUks3dCMiXJX901/5M/R4H5ByqS+LRoql09o0PDS9GOIqm1x68AQfFo1iHQhrhJW8
	 5C7dUZlRuefph1dKFQu7wp72l7z3fXqlXlT4sIwpn70WCgfIVnfm4u3AJZtOg+RW+E/WZ
	 GjEkyfursePeT6kajiiZ2/qKTX3veHVUsFE5zvU8w58sYBz1484k1vv5O1SElPQ+CSCsf
	 OC96Fh7dP5lOKwt4xpz6LEF8w8e0uj+ysERZp1/Qpyw6UgAjnwZWlM++QEBqGGJrOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sg9MYWc2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDEC606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDEC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sg9MYWc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795786838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+++htzLaVrGkvQnjm1karEJsL1q5AA/35ff8G5m2bmg=;
	b=Sg9MYWc2aEGfEF02fRbAvgsC3QUh3EOtHHcxapDiJtefTdubGkCmiEgJm4FpPJC1Sj9bXp
	El8KeCpK2wIVyXaNFkI5n46NNobYiuhgk4/EzF9isV52r86Xna+89oP26iHfmZmAk7CyK1
	C4Mxwfv+h8vJDNKDxlJQIqqlqbGa18I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-Q7glbEb1MnqY2j28k8Yu3w-1; Fri,
 27 Nov 2026 13:40:34 +0000
X-MC-Unique: Q7glbEb1MnqY2j28k8Yu3w-1
X-Mimecast-MFC-AGG-ID: Q7glbEb1MnqY2j28k8Yu3w_1795786832
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2662B1956079;
	Fri, 27 Nov 2026 13:40:32 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11471180054C;
	Fri, 27 Nov 2026 13:40:27 +0000 (UTC)
Message-ID: <826f2aff-5f94-40c5-8c80-82ae0f0c11e3@redhat.com>
Date: Fri, 27 Nov 2026 14:40:26 +0100
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
Subject: Re: [PATCH net-next v5 08/14] selftests: dpll: add pin priority test
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
 <20261125090522.3777494-9-poros@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261125090522.3777494-9-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/25/26 10:05, Petr Oros wrote:
> Add a test that sets a new priority on an input pin, reads it back and
> restores the original value. The range of priorities a device accepts is
> not advertised over netlink, so the test tries the two values above the
> current one first, none above 255 though, ice hands the priority to its
> firmware as 8 bits and a larger value would turn into a small one that
> ranks high. A lower value ranks higher, and in automatic mode a
> selectable pin that outranks the reference takes over from it once its
> signal qualifies, so one below the current value and the small values 1
> and 7 are tried only when the selection does not consider the pin, in
> manual mode or when the pin is disconnected. A driver may still refuse
> all of the values for a constraint the interface does not tell, so that
> is a skip on a device provided by the user, with the reason the tool
> reported, and a failure on the device the script created, whose
> simulator accepts every value the test tries. A current value the device
> does not take back could not be restored, so the test writes it back
> once before it touches the pin, which changes nothing, and ends there
> when that is refused. The test skips when the dpll tool lacks the prio
> keyword of pin set, and the restore is deferred right after that write
> so that an interrupted run restores the value too. A pin that does not
> advertise the priority-can-change capability or does not report a
> priority is a skip on a device provided by the user and a failure on the
> device the script created, whose input pins have both.
> 
> The dpllsim_add_pin helper gains an optional priority argument, which is
> written only when it is given, so that a pin without one keeps the
> default of the simulator. A priority is accepted for input pins only,
> so the callers pass one for those alone.
> 
> The standard device lays its inputs out as gnss0 with priority 0 and
> ext0 with priority 1, the plain input pin every stress device has gets
> priority 1 as well and its extra input pins get random ones.
> 
> Signed-off-by: Petr Oros<poros@redhat.com>

Reviewed-by: Ivan Vecera <ivecera@redhat.com>

