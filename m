Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600046;
	b=ZXHGEHJvCBeFxkX6oT3g39vyd51w0oh9qG6s24yfvAJQuBtjKsS3cjobdkEMT72LnCvI
	 zMPoTIBYT1AmJJIBqUHjstkbwqORNl7tcrhByQ5mqT8cZAcgADsuQDLGKH0bInA7kI5bE
	 dA1wVpQtWTRwxaV69kpp9WZySTd2bz5JWc1K4JU3RALIBULyxe8n1nCtRCA5sTgaiWvZx
	 QxvJIVg887ZK4KqiHDBQbshA0pglwmUNvQUv1ZfmcRRR46T0N/Ttu+EnDvO1Nw8qxy1ya
	 ZM76SOaiXavoYf2Re4Dng6ossKHHqW2k2rvPWnsiAFbDf+qRZF/jvk8/9E81Wx+UEsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600046;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
	b=W+oo4SUg1N8br6IZA1RSh28IU39UoTWxSXDYSRC0UfDwnldKhtq3VwPIpCjKL9TcbxL/
	 HXRcRPz22E4aIJbfNeVmg1qtoi3e48Nz/xICTLxXLpLO5FHd8zNbXEMC7BInuhNQ5o8f1
	 ShHxT6bibNwehheq9lki9gfLDrJF5Wjii64KiIy5qh+X7r9Sngqf38ltonaI/RlVW406N
	 8gGvjNAOwJCUwCe1FX6MoOHPHNjwd+PM7G4WBfUCEcFIFWcyxRoiCp3kZCLNFGWN/G17U
	 oOIXUQvNPm9rgQxEkeqnlBY2W5svb9rjUQxhgSdTNDnouqYK9d9408GKs4aaDHtUMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5qpcrjy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SbV+VjzN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30A606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B30A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z5qpcrjy;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SbV+VjzN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795600044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
	b=Z5qpcrjy4vNSY2GGB568YNneQzNKrrPCb6fAF5YqwQ5udfNoI9hLryFirVPe2rAbIKlmR3
	yYiaVzHcV9hOpY9JXOdSPrYP6fopeBKaKlOokid5PrJCSyyKdhIjwFbS1JdQ1W7p+BegeR
	MXm6oeDUjvQBKN6/jUiQmhePsFlU0kI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-wALeMnfzMSWKpVvNa6Qt5Q-1; Wed, 25 Nov 2026 09:47:21 +0000
X-MC-Unique: wALeMnfzMSWKpVvNa6Qt5Q-1
X-Mimecast-MFC-AGG-ID: wALeMnfzMSWKpVvNa6Qt5Q_1795600041
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4ab341c0696so1655969f8f.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795600040; x=1796204840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
        b=SbV+VjzNyPZ7gYbuTVl5EMIW/ZYyAW0LO3nHpvbnYlnPlYbZCZ7FoBbrc8v4fZ1LNy
         w6SIg5rKpiZgjz0EulivS6ZSMHRpwlmULB7yjmV5qgoIVneCjM67fuER2QgVllKbKgzz
         YEq4nj07m+SutXXKm11TPB5PGymKiK6ydZ3JmIbijDk3IkvLvfRjX/FQ6LERsiGbQ5z3
         vXjg7FmQ3BUM3ICySAkC9PvUz7fWTFLccJ/HLrf6C1+5CB4YnGGr/XRoqodkNy9co2H/
         ah0bw/x9LIxSZaFudklZF3MWcvlazTumu8HGGposVKkEPFy0BcNfrllpxfc5hHh8QC9r
         GuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600040; x=1796204840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkQtg4o+HEohpzTCn9QEYPwbpcKVcB7YKdwlB0VCIcs=;
        b=ibsKBzUHgY9U6S6y/ePahK/QopnZYzPPGCEG0hg1VO+H1txZuCzrWNyKh6ITptonNU
         RDlpvSVLNpyXNga5QMLcW5X0x8WYEyd6ACkgtAZ/s4HcJwdJb9gJv4+dlVCxXP4TAx+t
         SGnxopW4fNoupNdiz8xLkY6wuWvScHbqnHFhH6XgT4j39C5sNM/4CIDwzBrJLhYNwe26
         DoTQ2vd43WVlUR7da8xZCtt6owzfjUg0qRRotbFfeo4YS0xULyt2gD396kEJH8FHEq2C
         H0s8jQYxq10nyT4vyWpm2QpGajQ3rOcsBKbzKlrZxaIpElYRsvffddt133xNdvgde8/0
         XOkg==
X-Gm-Message-State: APuU4Z+Dwcg5LSTtAxs6EfHT3HcWv3XF8nox3eJHFcyE5yFf+DFYJuKO
	CouONZuqKdH4BJGFKjV5MwLW/qM4w8ltFirmtC5qScRtlZ4lZqtEwRkKsxSoGy/r1+BGKCxIjXV
	FN0co95mqK+ScjlxWtjLPWo98E1y+v4b8mKi+Xmg/fAKqa2xIRBo7utwSNkzJfXOsAQ==
X-Gm-Gg: AZFdTZcSKO9/bkmZEeFuIgFLgakmdRQHwK+vbvvseUGSlcOpx53reaZF7ux/oXuxD9z
	2P7XttxkejVaBepNpaD/lvIAAImWsgOz13gJa8LzFnFiuDA6RJUNUP7nrMArtZX2MVQuRmKaYEb
	Q1zgLjFM0rMcEHOmW4J2fnkrCrTWLSE/JIQjW+2tciUi6/imZ8k2aZkWsqUycsVp72fYvyP0ihQ
	VOTORIdJsAyDdZVpDJmXZJb2cetkk4wmuPzgYckGIl+IyDjQ7lPR/rRRQnaWO7rXF6dyjQTDwBh
	o5xnJdcnp8WVXy45b8le2QhOGrs3nqPEnLS+cf8nP2cXa79GvGugkx2VB0O3K4S7gfaqJddtzSO
	SoyO0xJ2HjAx9/29i9lAnHwu+jyII0dfmGTnjyx3Kqzi1oeYqU8y3dqUxKJ1CD223s9tQtBAylU
	3TxP0JofIvhVNp+BO63DfokBRnhL4pu1GQ3OyQF5IEoL54
X-Received: by 2002:a05:6000:29d6:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4abb2ce4db9mr21688032f8f.22.1795600040539;
        Wed, 25 Nov 2026 01:47:20 -0800 (PST)
X-Received: by 2002:a05:6000:29d6:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4abb2ce4db9mr21687997f8f.22.1795600039986;
        Wed, 25 Nov 2026 01:47:19 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm32143693f8f.36.2026.11.25.01.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:19 -0800 (PST)
Message-ID: <3e2585ec-00dc-4884-84be-51162a4d782a@redhat.com>
Date: Wed, 25 Nov 2026 10:47:17 +0100
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
Subject: Re: [PATCH net v4 0/2] ipv6: Honor suppress_prefixlength in
 fib6_lookup()
To: Ido Schimmel <idosch@nvidia.com>, Leonard Lausen <leonard@lausen.nl>,
 kuba@kernel.org
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Shuah Khan <shuah@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117110813.9894-2-leonard@lausen.nl>
 <20261124162628.GA3992049@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261124162628.GA3992049@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 17:26, Ido Schimmel wrote:
> On Tue, Nov 17, 2026 at 11:08:10AM +0000, Leonard Lausen wrote:
>> This revision removes the cached-exception patch and its PMTU test, as
>> requested. The series fixes the nftables regression introduced by
>> 1c32b24c234b and leaves dst-based prefix suppression unchanged. The
>> cached-exception work is deferred to net-next after the fib6_lookup()
>> fix is present there. Interface-group suppression also remains deferred.
>>
>> Patch 1 makes fib6_lookup() honor suppress_prefixlength while preserving
>> terminal reject results, including blackhole nexthop objects. Patch 2
>> adds six checks to nft_fib.sh using its existing fixture.
> 
> Paolo / Jakub, do you know why this is marked as "Rejected" in
> patchwork? What changes are requested?
Thanks for the head-up.

I think Jakub changed the state, I'm unsure why. I'll re-evaluate
this series ASAP (nowadays can't be very soon).

/P

