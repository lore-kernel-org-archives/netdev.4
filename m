Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527842;
	b=o3ZMIJui3bCSHHHkbJZSINZWyfA0o9q5U7tEYW7DnkvHEIHeuaYJswZOFAy+6Z0Eb7vW
	 NYLhmCQeMz1xDq6b3FueaZG6cNy3n1ghwJ4dDjWYpDZWSaqq5r5zPqC9Zijhe/5/opOZh
	 z5JX4BLmhZx7GkaCOtlraweJuLewDnWP/olDVVTQgZWiZhh4dYAioGBEigXdvbbym3OYR
	 A+YT4srH2T3G37NPqymk/ERsEUGJsXSeUXQAryIOr8A/xs7avtIWye4Ppy4Q/c63lg8mj
	 8jCPMvj4LS78K8oJFq+jZ5/xxL/W+9hLgyZdO1DkwXEOsdRDQfYZpkfVey8ZIJXdIog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527842;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rl/I+Qzj9uGsWdPg0dzGTE6b4xUU00vjT3Vxw5BJD2Y=;
	b=AzGOLvUfVpYVFcw0iTiSY1JX1MCu0hon21pPdgHfnYgQGGEPqdWPJfjWgxNoZcCnS7jI
	 ZSwSDkBBkTjrRIx2X0RJ1F1hoZoG4TUP9qF850n2hR0qjyBbrsM3Ey8NO6oVbEwDk56tX
	 DXPl+ZYvfKiwCKkFtR4FuAvrcggXyBvXtAt+i97wy7pHaf2ypYNbMZLO18Mh7YWV8HKUW
	 R00OXx2q8HaBceArG0LfsjuXmVwSAa2L7jCNsRQHfZldd8M3pqRPDoAyz3Om95nXADQ3P
	 Io3ZHG9FxdeTEB9hFY4fn2u0J9gLEvHP1w7WD3+tY0kJvN6vRpHfnJx5MaN1bKwM97Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWI1Ih25;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k2Ot8vSf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D7606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWI1Ih25;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k2Ot8vSf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795527840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rl/I+Qzj9uGsWdPg0dzGTE6b4xUU00vjT3Vxw5BJD2Y=;
	b=PWI1Ih25+Rv5pl0VY7Qcn46gEgdf7f6341ADyKTWk8ZHqfvRfyArGbTDnpSobFNph3WtNi
	a+sRcW0ORDwUdPgu2oau/mUFIfn87ULUzTvziWebtCvO7oNbKzsxeakX4hU1Q/DORTyXI5
	OaLoFUBZiMJBUhJ40+eJtmytqAvNeFE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-jtnUst9CMtSCEH3Ax6XdoQ-1; Tue, 24 Nov 2026 13:43:57 +0000
X-MC-Unique: jtnUst9CMtSCEH3Ax6XdoQ-1
X-Mimecast-MFC-AGG-ID: jtnUst9CMtSCEH3Ax6XdoQ_1795527836
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49090fde23aso2798337f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795527836; x=1796132636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rl/I+Qzj9uGsWdPg0dzGTE6b4xUU00vjT3Vxw5BJD2Y=;
        b=k2Ot8vSfeYlBhjaIYYuMR+UjqxML7Oxx+f480QrZxs2eMF/sIB4xrgX7ujxOYycRg8
         s7tupaXGjXK9u4Rngfi5Vrm462YpLJz1ilokba/9MZZQ16e9uLtU02y6mCj/5rkw5PGB
         r1qPs9enpj4KWutw4koIr5Rz9BlaqSlAWocjhF2sRPMlQXrqL/BhR8eOl1m/hWnT5b3l
         hAHW/bA8we1ixSIDpOT3O3Vxdi1t8fuuOSd7crVYBfQ2A4PbyDUO64qg4NgHrk25V5pM
         3RS1nkB8jB5Pp1/iSYnrOHcAU2XyoSkPEcMrtJauEdaE8nI2F8RJ82LXnwsmiLZQgfnl
         tDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527836; x=1796132636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl/I+Qzj9uGsWdPg0dzGTE6b4xUU00vjT3Vxw5BJD2Y=;
        b=VZ8F/18PzQEbElBTTrj9YxI3l4QobwDes1EhrmLWSZQzaOcuHqFYet1Dus+7t9165Y
         BjgDbi6hGWcYu8464XOmGD4reUGn5qdJWYbTXPBWIn9s2HKmGQqNH35Bzk1KybUjfoTA
         diagiaU6xGYuHAG/s6w2ddgtEzymYK/KuBejnVIuE48QIBGL+QYY2OXC9Pzmqj3pDuoP
         P/i/fCj4G4CmaO93F/77Zra3faaYvGnqCkX0RW2bptqu/FDxw75tkYkRkVz3pjO1e6KA
         Z3liVoQgibnom5KOFh44ubSSYbEgEyQKSD/BTyRkiEL7WQhSBYG1F73umikN1OzL0Nq0
         34IA==
X-Forwarded-Encrypted: i=1; AL+hErEB54BhPxpZFEncqhj11sw5fKTQcxv1zvVWgSrAqjnEftGNQXL5zEMmAgBB5BxokSNwi25Iv5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g9ODB2NIoIC/6kwCjMvEP5+iN6pBcDhngQVgDL17WNITzVEWk
	pWvSZP+4AY2SMDeCe926AHDtxuqFTBEqR3IS3H/ty6P6K9kI+egX+vD42EYnkTew3Gr/gOEu99/
	aM5GFV/VuJ2djSecjWJ/7u0j1Kk6qeOL+s9cng01y9/uM4N0hgUIhhImSOg==
X-Gm-Gg: AZFdTZep+tlAvLUmmjPAIFJEwRqg5ppOUUeNhski3dXBQmAyUiYdPEMdGqLIMlFVebc
	mfTcymiijs9mavxcltM6BZf1dSRmPBzc+Sy4rIVjVJ5ShZuAfRo5C22T7DUNvnHlSwzkB7HaI0g
	akwMf5HwyrIZjgVv0fBkRawN21udRWPMcVc72jHGZKd9F+OoEjlaCA392AUhcF5UBj5yCDp/Jn2
	zchxlIV+gKQYG828Sq0f0t7/lgdjzhZXByZXELlLUS1hzls3JPGntnxrT4iqVtI0vhSBPtdRzQM
	kablcVi5qG2nQFu0YHQCv1TwE/aT/cC9cviNVe42efrf4a/2WLnVNqMcAWfA8bGiq7hPOf68ce0
	VpH11bKp1HVl7RhIrxuANwfkCT9Rh6mEpKoRqhs0UcD7/5sOAe9sSK6+UQV17dReA0aEYgdyibA
	QYCCLhHOxUwdFe69rMrPVL3tWSI/Sozue3rdFDJGL+PV8q
X-Received: by 2002:a05:6000:29c6:b0:49b:b93d:9631 with SMTP id ffacd0b85a97d-4abb4b85a51mr20666624f8f.48.1795527836014;
        Tue, 24 Nov 2026 05:43:56 -0800 (PST)
X-Received: by 2002:a05:6000:29c6:b0:49b:b93d:9631 with SMTP id ffacd0b85a97d-4abb4b85a51mr20666573f8f.48.1795527835548;
        Tue, 24 Nov 2026 05:43:55 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm32111230f8f.14.2026.11.24.05.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:43:55 -0800 (PST)
Message-ID: <f0a3c071-0142-4c62-b74b-ffff8121c8d9@redhat.com>
Date: Tue, 24 Nov 2026 14:43:53 +0100
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
Subject: Re: [PATCH net-next,v2 00/15] Netfilter updates for net-next
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, davem@davemloft.net,
 netdev@vger.kernel.org, kuba@kernel.org, edumazet@kernel.org,
 horms@kernel.org, fw@strlen.de, ja@ssi.bg
References: <20261123135726.3940688-1-pablo@netfilter.org>
 <8e69f35e-73fb-4558-910b-45f5e723c64a@redhat.com>
 <awWSHujeBmMMOonS@chamomile>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awWSHujeBmMMOonS@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 14:33, Pablo Neira Ayuso wrote:
> Hi Paolo,
> 
> On Tue, Nov 24, 2026 at 01:27:35PM +0100, Paolo Abeni wrote:
>> On 11/23/26 14:57, Pablo Neira Ayuso wrote:
>>> v2: address cover letter errata.
>>>
>>> -o-
>>>
>>> Hi,
>>>
>>> The following batch contains Netfilter updates for net-next. This is
>>> composed of four groups:
>>>
>>> 1) Patch 1 addresses a race in the nf_conntrack_buckets sysctl handler,
>>>      that has been reported by LLM. From Fernando F. Mancera.
>>>
>>> 2) Patches from 2 to 7: This is a conntrack hardening series to address
>>>      LLM reports of the issues related to skbuff mangling while a ct is
>>>      already present, leading to mismatch protocol numbers, ie. ct becomes
>>>      stale since it does not represent this skbuff. This is unlikely to
>>>      happen in a real world. From Florian Westphal.
>>>
>>> 3) Patch 8 updates nft_synproxy to address SYN and ACK packets only, just
>>>      like ip{6}t_SYNPROXY does. From Fernando F. Mancera.
>>>
>>> 4) Patch 9 validate hook priority so nft_ct template is narrowed down
>>>      to be used where it makes sense. From Florian Westphal.
>>>
>>> 5) The ipset hash types conversion to rhashtable, including a new
>>>      rhashtable helper function to flush and destroy the hashtable.
>>>      This is a rework that aims at fixing the existing resize races in
>>>      the ipset hash type, which has triggered a myriad of LLM patches
>>>      addressing the symptoms but not the core issue. This large so
>>>      we prefer net-next for these series. Series from Florian Westphal,
>>>      plus one patch for rhashtable to add a flush and destroy helper
>>>      function by Herbert Xu.
>>>
>>> Please, pull these changes from:
>>>
>>>     git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git nf-next-26-11-23
>>>
>> Unfortunately a couple of in-flight nf patches prevent the CI from
>> picking this series:
>>
>> https://lore.kernel.org/all/20261120111910.67379-1-juny24602@gmail.com/
>> https://lore.kernel.org/all/20261121212037.149722-1-omermetekaya0@gmail.com/
>>
>> Could you please re-post it? thanks!
> 
> Just a verbatim repost?

Yes.

>> (Do I recall correctly that guidance for nf patches is to not CC netdev?)
> 
> So CI is picking in-flight patches that were Cc'ed to netdev@?

Yes, CI tries to pick everything that lands in the netdev PW, which in
turn is everything that land on the ML and looks like a patch.
> I just want to understand if I did anything wrong.

AFAICS, nothing. It was just an unfortunate over the air collision.

/P

