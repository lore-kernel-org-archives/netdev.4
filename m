Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009921;
	b=b53h5mqpB4r5ENdcGqmp64iBfFm8FlRxyZgqfTr/E1LWdxtuBzvYKMLnEIsgn319KDBM
	 4hhRZUY1GTdkA8PkMSXltbv0M517ykXWAIO1hlEreim4BkP/mLoB6/sMdnFhzfwOwcQdq
	 S/isfW0j0tenWs7BZpN+EbMw+Ueooad4pAcGxnwgCS0zyZYrefrFLG7DMMZucycyAdutU
	 VeANunzd732gSM4eRJYgomSy6c8DjJgFEWlDup8RjIFrVjuSp7L5apw0mJGrIKsy1dwY3
	 VOmFbF5fa9uPc7oGgfZLQKWBFeBLmnZoW7bGr8rHlJZIJJ8zFQslcvFJExYkojqZSZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009921;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F8kua1cmraI2viyb+1+A/OTOAgSZVMOfMLbqcfW+fpI=;
	b=Mfhd6qUaMTmJDsKTQT7FO9kGjSgvYgXPEBv4twdyhCSPHM7iEseWL+gcSfpmfRpjbZuK
	 gDn6oGzvf8A58gs9Ya8uMULD3Zd2swKRxAyFUZv9bSwG2o/dr+t3CKQVar4n+QUE1DVk5
	 916WZbdfBe/M1BtNUcT0BEmXSxaGDEt5ssUJmfRWINh9OOGWUSrT4dHhFT58PCwsRRLaf
	 20vf2bI5P78OD1XvLARXJqMLDSK1s9Lx9/KPiBjnRuzeLBHKSGUpt/ACBpFOo93xCVBzh
	 zIDLd7diEDnheKrYTyAtQ7SXVDZeDinABTRPGBmIr+iCp5Kqn16djxD4crsVYs7VD7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+bcswEi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UhWP0F72;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811860A2630
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A811860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+bcswEi;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UhWP0F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795009919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8kua1cmraI2viyb+1+A/OTOAgSZVMOfMLbqcfW+fpI=;
	b=h+bcswEikVEQowqxdH0mb1yG1Ym0oF0pPyebxm4N8VSOexReSoz5tUVxCXtPekUUHCxfd6
	jMheDoj0/RrVz1QXoiQXlsaaqlBHk3L2gHvlLy5Bt8dTgKs1Aeo8PlwYC8fFGuFdX+AR4f
	18BoR5s9MB0dBYeeY+CzDAXm+P4mdME=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-YDRml7usM6qm_Hieko4Dvg-1; Wed, 18 Nov 2026 08:51:58 -0500
X-MC-Unique: YDRml7usM6qm_Hieko4Dvg-1
X-Mimecast-MFC-AGG-ID: YDRml7usM6qm_Hieko4Dvg_1795009917
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso116832f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795009917; x=1795614717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8kua1cmraI2viyb+1+A/OTOAgSZVMOfMLbqcfW+fpI=;
        b=UhWP0F723PqSIse4OJEyVD3pXKojB5z68m4N8zqJycze2xjMiRbMKDWvRLDlMzgRPb
         8UJ4wQsQTNCvu4DztlEp0SNnef3kHhlww6pBlIZCBM46a+xRHoMm8zP2VA/z0SAP1fhW
         e9zknukAigqNMyFlQ+GJ8jgruWSp1bQdhBP5dqQG767kHcoJ3ueFkEl/OIFf+JTK17WH
         Tx0+uiUYXClL+dELkob/KsoP2jjBwBMYLdbIDn77kwRanMr5h7HWWBHBStmZ0ztpqFde
         O34LlUlH6wERJ1aNm5v5oCLpgBuRb5nPXFDh5IYWj4NsuzjTSdikmhdUj//iBCrI31Sm
         aaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009917; x=1795614717;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8kua1cmraI2viyb+1+A/OTOAgSZVMOfMLbqcfW+fpI=;
        b=HHM77/7+9dfx0SEV4a+OB4kH8sbN1/yNMKREJk2cLFHhSKZdqQ+IFc3LKZSlZykRdu
         IfmVBF3PYKosUfOWZc7S31sEou5c19ymkOC0togXwMivoPEV97O8+dCY712unSjwIAfy
         P09ygg+ke/qc2wKyE3l+Lgq0Scr5lYb4/UG3gxy4vqrgMK/PtKSXPu3QJICP4Ht/gW5q
         FBc3sC9pdVBSeaPHbpwtSkHZaEf5gZA642Ma6QjqiNburRE++HIuG9BLwR8T4/XSNWR1
         JLqO+izOk9qXR+n2U+G0ZNiick11/T2X/lu/HJn0QXDolh5+ES1VoF1KSe8FyEdXznHP
         UE1w==
X-Forwarded-Encrypted: i=1; AL+hErFlxvuid4qh5S8HibhM3p661i3EITBEwFRY1WgY4usl51iMhonAUWLXq8caRnIWJjgy9gHPASY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fQUWTD1tmYKUbAbJBXoU0LW8/b+uNVUb+AFJBYHgFs5ZmoHIu
	bAoRscSasLOvFZgyBlGT0WmO2brjJZM5LF3jLq8kF5x7EDSs/6VqlmjSgduIpeJs5FT1M1RqX2p
	nWrejR25Hr8zPq26nIpU3c4tKqGBcrR4Cbw33MkImmQIQ3mOtV6HkKMCT9g==
X-Gm-Gg: AZFdTZcStE2GYfvWTuXcae7s67bNJTsNEZ2fT4n4k7/JLxd4t7cj/QCZhi3MdzrMGL1
	H3pfGqGKOZtOJIGONASw3vX6LAjVdTbKpOpAed9TSGG/DTA+28i95LU2zwSx5CgOuggfpWl0ThL
	RrdHgSo4ufMzORbSJBXJii9W6l0HgWVDXg7qoH0/Jkh1ECTZlv4MqSwdwEPqZsycGpF1tJc0ap/
	f86yzv6xuWg++i4JWA/o74G8Z2634/bg5tPai6ARRrvS9hNimTL7OerrDlDyDtnYHlqygEQx+ts
	8Rl8Sa7BY4hyJHcmPtcNnRR9ExFs4l4tkEknfwYY8aoqW0wVx7F+uj2bdlzzTPmdN6JkNQC5ot3
	7I7qboQ/5Ov44FTzRtjxPKIUC40eq+3kW5Axf0eAUTXxe5AU=
X-Received: by 2002:a05:6000:658:b0:4a4:4229:c3a2 with SMTP id ffacd0b85a97d-4a63984bb27mr4798115f8f.11.1795009916885;
        Wed, 18 Nov 2026 05:51:56 -0800 (PST)
X-Received: by 2002:a05:6000:658:b0:4a4:4229:c3a2 with SMTP id ffacd0b85a97d-4a63984bb27mr4798072f8f.11.1795009916375;
        Wed, 18 Nov 2026 05:51:56 -0800 (PST)
Received: from [192.168.2.75] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100c6bfsm4754288f8f.2.2026.11.18.05.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:51:55 -0800 (PST)
Message-ID: <f7f1ae2d-a623-4eb7-a178-c618316beaf5@redhat.com>
Date: Wed, 18 Nov 2026 14:51:54 +0100
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
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
Content-Language: en-US
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 horms@kernel.org, Jacob Keller <jacob.e.keller@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Marcin Szycik <marcin.szycik@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <CAJ8uoz0MMUx68rMZWoZs-JwjodpRixwQSrgpyta1NsanGPn=dg@mail.gmail.com>
 <av2syi6lE/Vp86QW@boxer>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <av2syi6lE/Vp86QW@boxer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/26 2:48 PM, Maciej Fijalkowski wrote:
> On Wed, Nov 18, 2026 at 02:37:06PM +0100, Magnus Karlsson wrote:
>> On Wed, 18 Nov 2026 at 13:00, Petr Oros <poros@redhat.com> wrote:
>>>
>>> I think this pull is a good moment to ask how fixes for Intel drivers
>>> should flow, because it is not the first time a fix spent months on
>>> intel-wired-lan and then hit a wall on net.
>>>
>>> My patches 2/6 and 3/6 have been on intel-wired-lan since June, v4 on
>>> July 8 [1]. They were reviewed and tested by Intel validation there,
>>> and four months later Sashiko found real problems in them on this
>>> pull. I have a v5 and will send it once it is tested.
>>>
>>> Jake's E82x timestamp fixes went through three pulls before a part of
>>> them was applied [2], and Maciej described the same loop on the i40e
>>> pull in September [3].
>>>
>>> I know Intel patches go through iwl and are not applied to net
>>> directly [4]. But for fixes it means that the review which decides
>>> happens on netdev months after the iwl review and validation, and every
>>> respin goes through both again. And if iwl stops cross-posting to
>>> netdev, as Jakub suggested [5], Sashiko will see Intel fixes only in
>>> the pull.
>>>
>>> So does the iwl round still make sense for fixes? Would it be better to
>>> send fixes straight to net with iwl in Cc, and have Tony's ack and the
>>> Tested-by from Intel validation on netdev?
>>
>> Glad you brought this up. IMO, it makes no sense for fixes to go
>> through iwl and it makes contributing fixes (or new
>> features/optimizations) a lot more painful. Sometimes even to the
>> point that you just stop contributing something. I am not in the NIC
>> team at Intel, but sometimes I have to do network core work that also
>> touches our drivers. In this case, that patch set goes straight to
>> net-next (as iwl cannot and should not take core patches), but any
>> driver fix that I find on the way needs to go to iwl-net so that it
>> can go to net and be backported. So the fixes that my patch set are
>> dependent on and that should go in first are instead sent to a
>> slow-path (i.e. iwl-net) and after X weeks/months appear in net and
>> then net-next. But my patch set in net-next is dependent on these
>> fixes so I have to either wait or just cross my fingers that my new
>> feature is stable enough even without those fixes. Not optimal in my
>> opinion.
>>
>> So anything that could be done to speed up this process would be very
>> welcome. Sending fixes straight to net would be great. The validation
>> team could pick those patches up from the list and run the regression
>> tests against them, or would that take too long?
> 
> Regarding providing Tested-by tags, could we lift the policy where only
> Intel validation is allowed to bless the patch? Nowadays with AI regular
> dev can spin up a nice pile of tests by themselves.
> 
> So if you send a fix and you can find a peer that will test and review it
> for you, I don't think we have to wait for validation folks taking care of
> it if they are swamped.
> 
> I also don't think it would backfire on us and we would introduce some
> bloody regressions, given we have {s,cl}ashikos in the pipeline.

BIG +1

> 
>>
>> Anyway, good initiative. I am sure there is a solution to this that we
>> will all like.
>>
>> /Magnus
>>
>>> [1] https://lore.kernel.org/all/20260708125755.706263-1-poros@redhat.com/
>>> [2] https://lore.kernel.org/all/20261021-jk-e825c-timestamp-processing-logic-fixes-srcu-v5-0-72289a4ac8eb@intel.com/
>>> [3] https://lore.kernel.org/all/are4rBUJO3mzrkO8@boxer/
>>> [4] https://lore.kernel.org/all/20260721174642.7749143e@kernel.org/
>>> [5] https://lore.kernel.org/all/20260922112216.41e6f8cf@kernel.org/
>>>
>>> Regards,
>>> Petr
>>>
>>>
> 

