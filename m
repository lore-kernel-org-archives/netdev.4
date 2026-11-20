Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199194;
	b=ushl1FvMgdoOkgtI9pBmsBvC9iCzvYuX1wB/+QJkAqZs2UlGT0BO4X1X6P2ms9KqDYTy
	 hG9/0URQru7dTu1PfbV1eKbfKOMwX52zKgCKCrGpTV7K679SlgqZCzpl6O0uLN8T/aGHG
	 vmROVGTK3yV545H5Zb3Hqi1N/J+IHRDwipQJaQXTih1eFEcZ7JV84cixJb+mRMpalfXo3
	 ahJvRBv5urzHo5MrbL6207/lvgto7BFWVzaHixCiAgmGgYJvliu9eX3t0FQ6E/6wt5yPm
	 WBP6LYLkPE0/sJVhS4nwfPCGiNjypVw293OzUiIrdUvXFjUpTGSFBlvXGjAs0QmAVNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hiyFKVpmmZxy1WJhIZ2wQOiq0flu9/jgh5TB7ONFXc4=;
	b=gYP1TSRugfSyMLTofspWGhJL2B7h428rRo9vmwxfDkjqB1MYZAWtTgHU7UNOyg6N6pYO
	 vcT6MNZy0/yed33/Hv8njLwtNcqublAgkAVjRva+7c3t9eHQ/CarcKhNOB2hcaUOW7gkO
	 733zgIL/CjOjLIkICf1M4APAY7HY08O2fnJztsvzXMNX2pgefbeviw478s7XzFSCFyX5A
	 0sA4aLQ9VafFxwBJ04UL2PcTjCkGo6JONnpoc3nNvuDL27wivEWHd+NXNHwxl4rR1a4A6
	 oynrDUaoWoDNgM03rd6sCDB+rwErfbASpAumLZWw4red+sfDsFqZcaHjJKB3+iVGO3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="a/3ha5sa";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C08606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C08606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a/3ha5sa
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38587f3de36so1430388eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199193; x=1795803993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiyFKVpmmZxy1WJhIZ2wQOiq0flu9/jgh5TB7ONFXc4=;
        b=a/3ha5saUfvEW5Ua5HPuBbNQ1V1As+4BM/acXODn/gT96QZO5WsVwMU47R3EGbaYN8
         AgaVEeT6V/mSy8VRWYTCW3WJ6vbjs3XIfS/nrVfUv8a2uhndA1h5cZTKC+AE+bLHAWlN
         dLoI05Wi+YyOKZ4+Xspl9XF3dhYQDCZ3gjyLykfqzWnMtirh6NCHdoonV9OYz9M9EY9S
         OsIqZLzny5QD+mkPwqEpKeyTC70n4TE8amHOki8mkM2PCU8GfcKhVqrbTw5cEnbQJTwN
         SkBvrcVknPEmCXbXQ7G4wSjuQBhGJpH9/5ulrcjioJaD+ETnVrInfpZgenGBCkZDghrU
         puqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199193; x=1795803993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiyFKVpmmZxy1WJhIZ2wQOiq0flu9/jgh5TB7ONFXc4=;
        b=rPbcKUO0zdF+2BdW0EcND0KImDlzuQ6rTW1mtU0jw1gLlwviLsYRIId06fFIJTXOTu
         53whS4xJWFmy9jtV08CPRLZTg6KinbpoqBeJHJGh5Mz5fEvR1JwJjoQoKachsTfBX5tD
         TvcjkKdVQtRIRUxPXYVWwPLVIGwEBL34kZnVPi7BFqQzzWiEF22c+1zlv3Ls9Wturk1A
         FIB3hQRBsdSAVhk5Bxuz0vBsHumWdJUqM91bRHZWV4gAhBn4UMOrFM0xSy9OwCeWD34J
         omcVHQV9EHQ67GDlAQd6QSSQv+nSGm9V9wGe6OTMHTg238M5LirSLmRGcohGHBwSXnAv
         dB1w==
X-Forwarded-Encrypted: i=1; AL+hErGWobh88gzQvhFE1Ruo8Y49IzxeMLq8zO7mzVO5r2Dt7olD4IMShN4reZm4MzfKZPsOw2oq+HY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HMb5eWnkk9lOI9CyyX57o1Pz2NMJi0Cp5NyaiNDUKEaRJbOzQ
	C6VBDOXKVfastW1PpJ978NJAdaYsMDn4OjjZ6c3PNzoVBPc9I6UaTTal
X-Gm-Gg: AZFdTZcwYgsotPQYcE42VITJFkMHwEiLHngZCg2nyUsu4tNRenMjZLnmNbLxnGPx4bd
	iNkMPgDy6INSfN0RqZN4qrHEejd5uY6s55CmK6232/KC3+RAJ+Yz0z92Zk8l8XwWgLI4h/RWKvk
	v+gVB4UOyzcX8HURzDZ98tUDSsFXX3pu+agw9m+rEMazhKtTXH6z2SHdkKQ2pD7F/CIdav4wTyn
	yqW4uQUUDozfc7gSd77+PO8nGleZCT942lCtnxaABxSkKH7OEO3xXI+alRDeAxpN6fi65VXweIz
	jLjiIGrGa0mJJnZoPSjyolgDO0HZCm88vifpPgaSMwPK1UF6PNXfvcWkY3o5qqAdW4bl0eG4eZt
	THk38XahEL5nc/JU9Vv8IsaRvLx18c2NCDpZAFqhPDFSiE+ctpcBtqkskI9K1BRXxFow+Qc1cRV
	JZ84zGrg09hgGR560X5qHbv8l++OlzGb9OK98QAyaB1DlApv4YHFtbxhgI7DbKRrtY15PIdQ6pT
	pwYjvl21fODqZBrv2hhCWJmNpIynMaV67a9JjPFyYRYMbNGv9gCgs8VB2436bxw4Y2crZoyFVo9
	e2xdyeSbgEgR8Xj9NA7NyTx7elV+7tI4XOaqvAQ3zYx5ub6o9WMdtlIyjTIW8WsxIhQW9UAXr5Y
	SY/M=
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr5515943eec.27.1795199193306;
        Fri, 20 Nov 2026 10:26:33 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:18db:c1e7:4974:be38? ([2620:10d:c090:500::5:5388])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm9144539eec.17.2026.11.20.10.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:26:32 -0800 (PST)
Message-ID: <cf523269-53c1-4357-a628-87e25e5a6ae0@gmail.com>
Date: Fri, 20 Nov 2026 10:26:32 -0800
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
Subject: Re: [PATCH net-next] net: mlx5: Allow police as the last action of a
 TC rule
To: Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org
Cc: saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
 cjubran@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, idosch@nvidia.com
References: <20261117031337.4126403-1-mohsin.bashr@gmail.com>
 <82d9959a-8176-4433-94a4-ff72445306ca@nvidia.com>
 <09ae2064-38ff-4d25-83e5-0ac4c3eb1658@gmail.com>
 <194e1103-0d28-45d4-986a-819955e11268@nvidia.com>
 <acd93d7c-1e91-45f4-b178-07c6afea7fe5@gmail.com>
 <0a9b34c9-32d8-4325-aaef-c358c41a9f5a@nvidia.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <0a9b34c9-32d8-4325-aaef-c358c41a9f5a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 10:06 AM, Mark Bloch wrote:
> 
> 
> On 18/11/2026 2:52, Mohsin Bashir wrote:
>>
>>
>> On 11/17/26 2:14 PM, Mark Bloch wrote:
>>>
>>>
>>> On 17/11/2026 23:52, Mohsin Bashir wrote:
>>>>
>>>>
>>>> On 11/17/26 11:18 AM, Mark Bloch wrote:
>>>>> On 17/11/2026 5:13, Mohsin Bashir wrote:
>>>>>> From: Mohsin Bashir <hmohsin@meta.com>
>>>>>>
>>>>>> In switchdev mode, mlx5 offloads police only when other actions follow
>>>>>> it. TC needs no extra action for a police-only rule to work. The mlx5
>>>>>> driver makes every police rule forward to the post meter table, but for
>>>>>> a rate police it adds that forward only after verify_attr_actions() has
>>>>>> checked the rule, so the check rejects it. The ok result of police is
>>>>>> also handled as pipe. In TC, ok accepts the packet and ends the action
>>>>>> list, whereas mlx5 goes on with the actions after police.
>>>>>>
>>>>>> Support police as the only action of a rule. Set the forward while
>>>>>> parsing police, as is already done for police with mtu, and forward
>>>>>> an ok result to the end of the TC chains, as the driver does when it
>>>>>> offloads the gact ok action. The upcoming selftest series also relies on
>>>>>> such rules for TC offload validation.
>>>>>>
>>>>>> The patch was tested on a ConnectX-7 in switchdev mode with the command
>>>>>> below, and it was verified that the rule is offloaded and limits the
>>>>>> matching traffic to the configured rate, using the hardware drop counter.
>>>>>>
>>>>>>      tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
>>>>>>        ip_proto udp dst_port 5201 \
>>>>>>        action police rate 100mbit burst 1m conform-exceed drop/ok
>>>>>>
>>>>>> Cc: Carolina Jubran <cjubran@nvidia.com>
>>>>>> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
>>>>>> ---
>>>>>>     drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c | 3 ++-
>>>>>>     drivers/net/ethernet/mellanox/mlx5/core/en_tc.c            | 3 +++
>>>>>>     2 files changed, 5 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
>>>>>> index 1bd1c94fb977..52295f5d644c 100644
>>>>>> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
>>>>>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
>>>>>> @@ -94,13 +94,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
>>>>>>                   MLX5_FLOW_STEERING_CAP_MATCH_RANGES))
>>>>>>                 return -EOPNOTSUPP;
>>>>>>     -        attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
>>>>>>             attr->flags |= MLX5_ATTR_FLAG_MTU;
>>>>>>         } else {
>>>>>>             attr->action |= MLX5_FLOW_CONTEXT_ACTION_EXECUTE_ASO;
>>>>>>             attr->exe_aso_type = MLX5_EXE_ASO_FLOW_METER;
>>>>>>         }
>>>>>>     +    attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
>>>>>
>>>>> This makes every police that is the lact action pass verify_attr_actions()
>>>>> not only ok case described.
>>>>>
>>>>> what happens with:
>>>>> "police ... conform-exceed drop/pipe"
>>>>> with this not writes to FTEID_TO_REG so what happens once a packet
>>>>> reaches the port action table?
>>>>>
>>>>> also what about:
>>>>> tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
>>>>>        ip_proto udp dst_port 5201 \
>>>>>        action police rate 100mbit burst 1m conform-exceed drop/pipe \
>>>>>        action police rate 100mbit burst 1m conform-exceed drop/pipe
>>>>>
>>>>> won't this create a loop?
>>>>>
>>>>
>>>> Thanks for reviewing Mark.
>>>>
>>>> Ahh! I missed the loop case. I had a patch to handle pipe on the last police but I dropped it, since my testing showed the post_act table still passed the packets up. Let me respin and send pipe and jump on the last police to the end of the TC chains. Would that work in your opinion?
>>>
>>> Yes for PIPE.
>>>
>>> For JUMP, we need to check the target. tcf_action_exec() counts from
>>> the start of the action list, so even the last police can jump back
>>> to itself or an earlier action. If we can't offload that, we should
>>> probably reject it.
>>>
>>> That's how I read tcf_action_exec(), but please correct me if I'm
>>> missing something as I'm not really a tc expert.
>>>
>>>>
>>
>> Yeah, jump restarts the list. Before this patch police as the last action was rejected anyway, so I believe rejecting jump there in the respin should be okay?
>>
>>>>>> +
>>>>>>         return 0;
>>>>>>     }
>>>>>>     diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>>>>>> index 1d35c97aea0b..8685e41487f3 100644
>>>>>> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>>>>>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>>>>>> @@ -3892,6 +3892,9 @@ alloc_branch_attr(struct mlx5e_tc_flow *flow,
>>>>>>             attr->action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
>>>>>>             break;
>>>>>>         case FLOW_ACTION_ACCEPT:
>>>>>> +        attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
>>>>>> +        attr->flags |= MLX5_ATTR_FLAG_ACCEPT;
>>>>>> +        break;
>>>>>>         case FLOW_ACTION_PIPE:
>>>>>>             err = set_branch_dest_ft(flow->priv, attr);
>>>>>>             if (err)
>>>>>
>>>>> This also changes rules where police is not the last action.
>>>>> The conform result defaults to ok when it is not given.
>>>>>
>>>>> action police rate 100mbit burst 1m conform-exceed drop \
>>>>>            action mirred egress redirect dev eth2
>>>>>
>>>>>
>>>>> won't with this change the conforming packets go to the tc end table
>>>>> and not to the redirect dev?
>>>>> The rule is still reported as offloaded and installs the redirect
>>>>> which can't reached now.
>>>>>
>>>>
>>>> Maybe I am missing something here, but when the conform action is not given, doesn't it default to ok? For example, if we have
>>>>     action police rate 100mbit burst 1m conform-exceed drop action drop
>>>> shouldn't conforming packets still be pushed up rather than dropped by the following action, making the action drop (or the action mirred) dead code?
>>>>
>>>
>>> Yes, agreed, the following action is dead code in software too,
>>> a separated cleanup patch maybe?
>>>
>>
>> Yeah probably.
>>
>>> What about packets that reach the rep? I don't see anything in
>>> the ACCEPT path that tells software TC the packet has already been
>>> processed. For example:
>>>
>>> tc filter add dev eth2 ingress pref 100 protocol ipv6 flower skip_sw \
>>>       ip_proto udp dst_port 5201 \
>>>       action police rate 100mbit burst 1m conform-exceed drop/ok
>>>
>>> tc filter add dev eth2 ingress pref 200 protocol ipv6 flower skip_hw \
>>>       ip_proto udp dst_port 5201 \
>>>       action drop
>>>
>>> Wouldn't a conforming packet reach software, skip the first rule and
>>> get dropped by the second, despite already being accepted in hardware?
>>>
>>> Can you test this? The existing gact ok path might have the same issue.
>>
>> Yeah, in both cases (police and gact ok) the conforming packets are pushed up, where they get dropped by the skip_hw rule. My understanding is that with existing behavior the restore doesn't happen on accept path, so sw tc takes the packet through classification again.
>>
> 
> Hi,
> 
> Sorry for the delay. I had other things to deal with and wanted to
> go through the original internal reviews before replying.
> 
> I'm fine with supporting this, provided we preserve TC semantics:
> 
> - ok stops processing; later actions are not executed.
> - jump executes the correct target, or we reject the offload.
> - pipe executes the next action, or ends processing if it is last.
> 
> Please address the issues discussed in the next submission.
> 

Hey, thanks for getting back. Please have a look at v2 here: 
20261119040010.1405900-1-mohsin.bashr@gmail.com

I believe v2 addresses P1 and P3 fully. P2 needs some feedback. I reject 
jump only if police is the last action.

I can update it to reject jump unless police is the first action and the 
target is within the action list. That way jump always land on the same 
action as in TC or it gets rejected. What do you think about it?

> Mark
> 
>>> Mark
>>
>>
> 

