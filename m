Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627964;
	b=GAkKtQAG77xQFsxq8wdnBqWXd4/bhVpTBVOxhztcjTNNFrkdI3iteuKl6gWDeNcaIjNh
	 kX2mB6RwaOH8QpcujvbKiv4AEu+9GRSfxCMsedZo95BPpcqSt85/8BDSoKm0LN0IEMy6q
	 +/ebNSrqqQF/pQp/jvb5TToW3jGBaN5P9vsRBxEseWqfQB9I6zXlBBlByr82MVtwhm0hv
	 JpCxYno55o8tLWzLFjxKgS14sg3eyRP0+EhG42LDD30yjGWSpsiWZ9Nb7q7d+rmE7fkdp
	 fEZxzMGYLNEKmVyVggYIPHbRFlmW+nQusLuevNM/QcvHtemqbdUxZPX0Piy77yXukWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627964;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=WucTkONZzaXCejjf9omo6YHUpNXk7nirNn+2T8Pb3AY=;
	b=yqSBzE5T1SXLbY4VDqkRaz+eCk221cLD/4jV0Sf6oS/RP/nRyl4lLG68lpBZUfqngwQJ
	 ISUKhAXo0WYnswtzVk2kxk8ZJma+Tn0V1PPJqv7XyUUK7oY2JzxTCnwqkSIUt8dXzMJ/H
	 rol5TjdCr7FnEpVk6mWNAJpQ1Ux/IJ09KxntVd6n4zZOBnhIcjEvWo9eytTAr8ZL6oegz
	 4iYfMAPFZoIdabs42H+lpvY4q/VJGk3TvpzwgP3sVU6kXWCwDxBh7k2GhvR5v+5+ebe8z
	 dj2KlmgAbFD/mlPGdMYLETV82Jh5T1I8HRzmBFajAQN79XSdhQenF/eKPx0Iu1gf3/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KuzECQVJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE3F606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE3F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KuzECQVJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795627962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WucTkONZzaXCejjf9omo6YHUpNXk7nirNn+2T8Pb3AY=;
	b=KuzECQVJ/6v2d6ioB3X7Jne0Bu6fdMASDgZmLDk2TBjoOUjOsp613M5gTVVD3oZ3X42u2e
	7trLFuJOfL4v5qxQ4O7wNlntKGngsUnlqbHEpQhXIFgFiDqizTQA0ZUCUPfmxF5fe1VCpF
	+WDI9f3+CBwUCSB3N6OGKyw/+DS/olM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-OGthewZdO1SkU1XM02l6IQ-1; Wed,
 25 Nov 2026 17:32:37 +0000
X-MC-Unique: OGthewZdO1SkU1XM02l6IQ-1
X-Mimecast-MFC-AGG-ID: OGthewZdO1SkU1XM02l6IQ_1795627956
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5AFA21800546;
	Wed, 25 Nov 2026 17:32:35 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5396318004FF;
	Wed, 25 Nov 2026 17:32:32 +0000 (UTC)
Message-ID: <b885f708-96a5-430c-b3f1-e55ef0350c1c@redhat.com>
Date: Wed, 25 Nov 2026 18:32:30 +0100
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
Subject: Re: [PATCH net] dpll: send the device delete notification on the last
 unregistration
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Milena Olech <milena.olech@intel.com>,
 Michal Michalik <michal.michalik@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261125170234.294969-1-ivecera@redhat.com>
 <179562646113.3294.4642015829884997946@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <179562646113.3294.4642015829884997946@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/25/26 18:07, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

Sorry, this was discovered during manual code inspection.

Thanks,
Ivan

