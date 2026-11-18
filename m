Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026357;
	b=OSp/t9ss07Zx1wc964Z0NZbbaofq6l65hxPKdkmA1cY3hZw1v4emDJgfiKAO+hiF1gQZ
	 do2Bap42VfI+mW2hC9Wa9U5LojYkx9dfGZfSyCRxdZp5347avymNd+cgWyK0bX7kqAEXm
	 vpyALhkz5AC7ZD7O/31L071EvV+lW+1Qgr7lvTqCHdt7z4FH3p2AU6ZVUlnTJsHbtUMBc
	 iXPMlAiGHWYGVr4d+IjQrRTyvCbte25paa2h0aJS7+sVnbmCjL8aEHWf3Dgm/jWBCnLZx
	 cSyGbqW+jr6VtNsWCFTgc5CBVFbAESMVtQ9iFO5Xv2qXNwyGOn/p+TZtOR8T7U3bLgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026357;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=u00XawEdYv28je6l9Cy2re3mAXMzuZHBJZyPkG7B0Do=;
	b=B4NNDYMGeAs16OMq4HAtTA7v39PEdJHXhnvC+YW6V4wQJJuLZrgtxTGv5yqDXijn8Sqn
	 18/b/Nsq+7FbsRIUKeIwBJ/Dfpc7aSegzJHe1zM6MQEzT+djmru7HFb+mOm5mnk9nW5zW
	 bILdaPpiMUHQYgEV0C0bN5ro83angX3LPBUNGGHngvhgFw8INaBgzPt3sMpUkjji0a28V
	 C9nR1NRjNHLSsjRRoPsVTOHYXg0evgJ48ZxDthxmBuyfIdynCDmyKe6TvOMRLJL8r0Hfw
	 vpnIgnQP+nlYeQcTPf7bfs+/ls55lF/3mBgM5+nFRi2Jnc75QABOnxvPcm12eeoT5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JxmHniew;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28040606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28040606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JxmHniew
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1187480a91.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026356; x=1795631156;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u00XawEdYv28je6l9Cy2re3mAXMzuZHBJZyPkG7B0Do=;
        b=La48DumSoJjfelO6gwrCMi18hvv7BEFTZp9ZQxhtyqC036OMpBaqpla8u2FjY/MiPh
         aoMJ8B7PGlQNeeQcR/wt99wxRO4OUCticD5iNQiLxdTgfZqi7Q+vIOfljwh1xd1NRA4m
         abNeGotj9RkGk9JDQtVHxijZzkES7UAW4Lw79W9/zq8jThi2HiKCscP/WCJLS09qvbyr
         5Q4mMC9edFmY/r7ZA69ObEmb9gacFPHj00ID8tQclJoWjkIhAFI1nx7Y+i4yMppVU74a
         5Yoe2I2tD/TE+ZJO85riTp+N8pIa3xI2iY8a2wP1cdaWl3tgZX4qiBrGJKcyuJkeF0/3
         +seg==
X-Gm-Message-State: APuU4Z8BsUf4gWX3T27p0t6RcwfmFEPcSCTNUK+Oz3yHqEXe6fOG43RO
	SL9+UQDeEF/hUQzWnF8zbX2YgAhacYpv1X2p+/mrzbSJbNeFpfvw0kl0Y6lkB6+Iz3xotNQSqPT
	dNjSKofU3S6uLVEBZUVKwqgb+dMJj0sEl5z26FgyfGNBADfUNyGWuAcP6roGc5KL4KlmiqUYoDb
	ZK4BAE+C1lBvcREI30igzAGa5sPx6uRu/e6Sa6V1uZzE9KqcEp36vG+PMuo0A3USNur0IrLjcw4
	Fyy0MVWUIOfaO1T
X-Gm-Gg: AZFdTZdrGYsHHBCvDBO7K/paD8ERK30ova6PmBnJ/pzuSF9+HrtkyqK5ZrXQW2D5YPS
	+Hhx4VSpb1Cxb+T0F7rmK5aXniN1oaA2Q5zrRNMKuS0NHtN7FtHgrAOsRSOtLmzjFYWOPrQiNY8
	5JNRnZJuWMNJ35IEanDUdGvFEYPJ2DgfoGjM6lVTzg5cyzP2gLEnwUvarsbuS0rbynMChO4QQqj
	lAkPocxEV1NPdbIRfOksdPImmEDrKI0vm9QJ2t36+2H/O7Z6Y+2tz2neq9i48VM1wMnhdun4RqP
	8nWY8VoM2HBrzedwG4fNlQH+EF6mKjrQZZBjXDY1ZNPAKQAtDV0r+HXK9Wys9wm2PUh+Q9N1zo8
	0j/jngN23127fP+UT6UgoSHfwM188eLeAp1mhfchQbNeWBLP0sljIopJoG7ednxnAOJ9zVWd5ND
	bgGTZj5KNzprRtx1uVgFS3JsDE2gNTjmFZ5KD+IlM7
X-Received: by 2002:a17:90a:d44b:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3b3d06a48aamr3696471a91.5.1795026356546;
        Wed, 18 Nov 2026 10:25:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f339c750sm137361a91.2.2026.11.18.10.25.54
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:25:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55cc3c32e15so15359491cf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795026354; x=1795631154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u00XawEdYv28je6l9Cy2re3mAXMzuZHBJZyPkG7B0Do=;
        b=JxmHniew/LY+5mTcU/34RAHKXqimE7vDXfCOas41jXaCNxHNVuiu4T7+9ervGTQygo
         KTy2bqsElvn6le4DY4eeoGQdUigwMCyfr+pyMUA3BxXXk+9zFnQuHQ9VEBsgzW155Wrg
         j/E6/HdaKV3kfJKW/xXOKb3Y7XjW/oDQcltb0=
X-Received: by 2002:a05:622a:590b:b0:55d:3764:8787 with SMTP id d75a77b69052e-55d5a592f86mr54747691cf.25.1795026353580;
        Wed, 18 Nov 2026 10:25:53 -0800 (PST)
X-Received: by 2002:a05:622a:590b:b0:55d:3764:8787 with SMTP id d75a77b69052e-55d5a592f86mr54746961cf.25.1795026352708;
        Wed, 18 Nov 2026 10:25:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c52318sm5441881cf.29.2026.11.18.10.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:25:52 -0800 (PST)
Message-ID: <563a68b7-c300-4ec8-9594-9a79fe4c37d5@broadcom.com>
Date: Wed, 18 Nov 2026 10:25:48 -0800
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
Subject: Re: [PATCH net-next 9/9] docs: net: document Northstar FA setup and
 NAT qualification
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 horms@kernel.org, corbet@lwn.net, jonas.gorski@gmail.com, olteanv@gmail.com,
 pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
References: <20261116222519.1416501-10-florian.fainelli@broadcom.com>
 <179495817095.3136.15574702882079067890@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <179495817095.3136.15574702882079067890@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 15:29, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 4 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The reference nftables ruleset in
>    Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-…
> - [Medium] bcm-ns-fa.rst (lines 130-131) says "Every IPv4 FIB route, rule
>    and nexthop change flushes all FA-owned flows".
> - [Medium] B53 and the FA backend decide independently whether FA
>    metadata mode is active, and they use different tests.
> - [Medium] The FA block is at 0x18027c00 (reg <0x18027c00 0xc0>), which
>    is offset 0xc00 inside the GMAC3 BCMA core aperture (gmac3:…
> - [Low] The 'Automated validation' section runs kunit.py with the suite
>    filter `'*fa*'` against drivers/net/ethernet/broadcom/.kunitconfig.
> - [Low] The commit message for "docs: net: document Northstar FA setup
>    and NAT qualification" ends with "Keep campaign history and review…
> 
> --
> 
> docs: net: document Northstar FA setup and NAT qualification
> 
> This adds documentation for the Broadcom Northstar flow accelerator. It
> covers the supported GMAC2/GMAC0 topology, the device tree and kernel
> configuration, and how route and neighbour invalidation works. It also
> describes a three-host NAT qualification procedure, fault injection tests
> and KUnit validation, and adds the new file to the index and MAINTAINERS.
> 
>> validation from the driver's incomplete FIB eligibility probe. Keep
>> campaign history and review status in the accompanying package.
> 
> [Severity: Low]
> This isn't a bug, but what does "the accompanying package" refer to? The
> patch only adds bcm-ns-fa.rst, an index entry and a MAINTAINERS line.
> Nothing in the tree matches that description.
> 
> Could this sentence go in the cover letter or below the --- line instead
> of the permanent changelog?
> 
>> diff --git a/Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst b/Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst
>> new file mode 100644
>> index 0000000000000..2bc6cc5d94cea
>> --- /dev/null
>> +++ b/Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst
>> @@ -0,0 +1,507 @@
> 
> [ ... ]
> 
>> +Netdevice shutdown, address/MTU changes, new active switch ports, and upper
>> +interface changes flush entries. Every IPv4 FIB route, rule and nexthop change
>> +flushes all FA-owned flows, including unrelated prefixes and local-table
>> +entries. This is intentional: the rule does not carry enough routing-policy
>> +context to prove that an event cannot affect an installed path. Work is
>> +coalesced, but even unrelated routing churn can reduce offload residency.
> 
> [Severity: Medium]
> Can the IPv4 FIB notifier actually provide this guarantee? fa_fib_event()
> in drivers/net/ethernet/broadcom/bcm-ns-fa.c is the only route
> invalidation path. The same promise appears in its comment. However,
> fib_table_insert() only notifies when the new alias is the first one for
> that prefix and table:
> 
> net/ipv4/fib_trie.c:fib_table_insert() {
>      ...
> 	if (fib_find_alias(&l->leaf, new_fa->fa_slen, 0, 0, tb->tb_id, true) ==
> 	    new_fa) {
> 		enum fib_event_type fib_event;
>      ...
> }
> 
> The NLM_F_REPLACE branch and the delete path work the same way:
> 
> net/ipv4/fib_trie.c:fib_notify_alias_delete() {
>      ...
> 	/* Do not notify if we do not care about the route. */
> 	if (fib_find_alias(fah, slen, 0, 0, tb_id, true) != fa_to_delete)
> 		return;
>      ...
> }
> 
> Aliases are sorted by descending DSCP. If a prefix also has a
> DSCP-specific alias (ip route ... tos X), the DSCP-0 alias that ordinary
> traffic uses is not first. Adding, replacing or deleting that alias raises
> no notifier event. As a result, neither fa_invalidate_locked() nor
> fa_mtu_route_update() runs.
> 
> Flowtable GC doesn't catch this for hardware flows either, because
> validation-only references are skipped:
> 
> include/net/netfilter/nf_flow_table.h:nf_flow_dst_check() {
> 	/* A driver-only reference must not change direct-path/GC semantics. */
> 	if (!tuple->dst_cache || tuple->dst_validation_only)
> 		return true;
>      ...
> }
> 
> nf_flow_offload_validate() only runs at admission.
> 
> Suppose the DSCP-0 route is replaced with a blackhole, moved to another
> next hop, or given an MTU below 1500 as a non-first alias. Would the
> hardware rows keep forwarding on the old path while counter activity keeps
> refreshing them? The same gap applies to the later claim that flows stay
> in software while any route has an MTU below 1500. The blackhole and MTU
> 1200 qualification steps only use first-alias routes, so they would pass
> anyway.
> 
> A minor point: fa_fib_event() also handles FIB_EVENT_ENTRY_ADD and
> FIB_EVENT_ENTRY_APPEND, which IPv4 never emits.
> 
> [ ... ]
> 
>> +For a BCM53012 board, add the following node under the root address space
>> +(adjust the compatible to ``brcm,bcm53011-fa`` for BCM53011)::
>> +
>> +  / {
>> +      fa: flow-accelerator@18027c00 {
>> +          compatible = "brcm,bcm53012-fa";
>> +          reg = <0x18027c00 0xc0>;
>> +      };
>> +  };
> 
> [ ... ]
> 
>> +Remove any other conflicting CPU assignments for this test. B53 selects ``brcm-fa``
>> +when it finds the enabled accelerator through this phandle. Do not set
>> +``dsa-tag-protocol``: B53 does not implement the runtime protocol-change
>> +operation. No existing board is enabled automatically by this series.
> 
> [Severity: Medium]
> Is this the whole condition? B53 and the FA backend each decide on their
> own whether FA metadata mode is active, and they use different tests:
> 
> drivers/net/dsa/b53/b53_common.c:b53_uses_fa_tag() {
>      ...
> 		enabled = IS_ENABLED(CONFIG_BCM_NS_FA) && of_device_is_available(fa) &&
> 			  (dev->chip_id == BCM53011_DEVICE_ID ||
> 			   dev->chip_id == BCM53012_DEVICE_ID ||
> 			   (is5301x(dev) && of_device_is_compatible(fa, "brcm,bcm4708-fa")));
>      ...
> }
> 
> drivers/net/ethernet/broadcom/bcm-ns-fa.c:bcm_ns_fa_init() {
>      ...
> 	if (!of_device_is_compatible(np, "brcm,bcm4708-fa") &&
> 	    !of_device_is_compatible(np, "brcm,bcm53011-fa") &&
> 	    !of_device_is_compatible(np, "brcm,bcm53012-fa")) {
> 		of_node_put(np);
> 		return ERR_PTR(-ENODEV);
> 	}
>      ...
> }
> 
> bcm_ns_fa_init() ignores the chip. It then always enables FA_BRCM_HDR
> processing and clears FA_CTL_BYPASS.
> 
> Take the brcm,bcm53012-fa node from the example above on a 5301x switch
> whose runtime chip_id is BCM53010, BCM53018 or BCM53019. The backend would
> switch GMAC2 RX to the FA descriptor format. B53 would keep the ordinary
> brcm tagger on port 8 and skip the CFP exception guards. Would conduit RX
> on port 8 then be misparsed or dropped?
> 
> An available FA node with any other compatible makes bcm_ns_fa_init()
> return -ENODEV. That fails the whole GMAC2 probe:
> 
> drivers/net/ethernet/broadcom/bgmac.c:bgmac_enet_probe() {
>      ...
> 	bgmac->fa = bcm_ns_fa_init(net_dev);
> 	if (IS_ERR(bgmac->fa)) {
> 		err = PTR_ERR(bgmac->fa);
> 		bgmac->fa = NULL;
>      ...
> }
> 
> Also, "brcm,bcm4708-fa" turns on FA mode for any 5301x chip. That includes
> parts the binding, the Kconfig help and this document do not list as
> supported.
> 
> Could B53 and the backend share one predicate, and could the document
> state the actual conditions?
> 
>> +
>> +The FA resource is outside the GMAC3 DMA register window. It is managed by
>> +the GMAC2 consumer; it does not need a separate platform driver or character
>> +device. Leave the accelerator disabled or omit the GMAC2 phandle to retain
>> +the existing board configuration.
> 
> [Severity: Medium]
> What state does the GMAC3 core need to be in? The FA block at 0x18027c00
> is at offset 0xc00 inside the GMAC3 BCMA core aperture (gmac3:
> ethernet@27000 in bcm-ns.dtsi). bcm_ns_fa_init() maps and programs it from
> GMAC2 without checking or enabling the core that hosts it.
> 
> If the FA shares GMAC3's reset or clock domain, two cases look like
> problems.
> 
> First, when GMAC3 is disabled in DT, nothing releases the core's reset:
> 
> drivers/bcma/main.c:bcma_register_devices() {
>      ...
> 		np = core->dev.of_node;
> 		if (np && !of_device_is_available(np))
> 			continue;
>      ...
> }
> 
> Could FA register accesses then abort, or hit the FA_INIT_DONE poll
> timeout, depending on what the bootloader left behind?
> 
> Second, when GMAC3 is enabled, bgmac_probe() in bgmac-bcma.c only rejects
> the phandle on a core other than unit 2. GMAC3 therefore still probes, and
> bgmac_enet_probe() unconditionally calls:
> 
> 	bgmac_clk_enable(bgmac, 0);
> 
> This reaches bcma_core_enable(), which pulses the GMAC3 core reset. If
> that happens after GMAC2 has initialized the FA, does it wipe FA_CTL and
> the table state? The GMAC2 side would still believe its flows[] and
> next-hop bookkeeping match the hardware. BGMAC_FEAT_NO_RESET suppresses
> the reset in open/close, but not this probe-time enable.
> 
> The setup steps only cover GMAC0 and GMAC2. Should they say whether GMAC3
> must be enabled, disabled or left alone?
> 
> [ ... ]
> 
>> +  table inet fa_test {
>> +      flowtable ft {
>> +          hook ingress priority 0;
>> +          devices = { lan1, wan };
>> +          flags offload;
>> +          counter;
>> +      }
>> +      chain forward {
>> +          type filter hook forward priority 0; policy drop;
>> +          meta l4proto udp ct state established flow add @ft
>> +          ct state established,related counter accept
>> +          iifname "lan1" oifname "wan" udp dport 5001 counter accept
>> +          iifname "wan" oifname "lan1" udp dport 5001 ct status dnat counter accept
>> +      }
>> +      chain prerouting {
>> +          type nat hook prerouting priority dstnat; policy accept;
>> +          iifname "wan" udp dport 15001 dnat ip to 192.0.2.2:5001
>> +      }
>> +      chain postrouting {
>> +          type nat hook postrouting priority srcnat; policy accept;
>> +          iifname "lan1" oifname "wan" ip saddr 192.0.2.2 snat ip to 198.51.100.1:45000
>> +      }
>> +  }
> 
> [Severity: Medium]
> Will this table load with nft -f? The snat rule in the postrouting chain
> asks for a port mapping. However, iifname, oifname and ip saddr don't set
> a transport protocol. nft rejects such a rule with "transport protocol
> mapping is only valid after transport protocol match". nft -f loads the
> file as one transaction, so the whole fa_test table would be rejected.
> 
> The dnat rule is fine because udp dport 15001 comes first. Would a meta
> l4proto (or tcp/udp) match before the snat statement fix this? The
> in-tree nft_flowtable.sh and nft_nat.sh selftests do that.
> 
> Separately, the forward chain only handles UDP:
> 
>            meta l4proto udp ct state established flow add @ft
>            iifname "lan1" oifname "wan" udp dport 5001 counter accept
> 
> With policy drop, wouldn't a new TCP SYN match no accept rule and be
> dropped? The text below says "run a UDP or TCP echo server". Later
> sections ask for the SNAT, DNAT, pressure, fallback and aging tests to be
> repeated with TCP, but no TCP ruleset is given.
> 
> [ ... ]
> 
>> +  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>> +      --kunitconfig=drivers/net/ethernet/broadcom/.kunitconfig \
>> +      --build_dir=/tmp/bcm-ns-fa-kunit '*fa*'
> 
> [Severity: Low]
> Does the '*fa*' filter skip suites that this kunitconfig builds?
> drivers/net/ethernet/broadcom/.kunitconfig also sets
> CONFIG_NF_FLOW_TABLE_KUNIT_TEST=y. That builds the nf-flow-lifetime suite
> (net/netfilter/nf_flow_table_core_test.c) and the nf-flow-path suite
> (net/netfilter/nf_flow_table_offload_test.c). Neither name contains "fa",
> so the documented command builds them but never runs them.
> 
> nf-flow-path covers the cached route and neighbour validation in
> nf_flow_offload_validate() that the commit message relies on.
> 
> Should the filter include these suites? Should the text below also
> mention CONFIG_NF_FLOW_TABLE_KUNIT_TEST next to the three suites it lists?
> 
> [ ... ]
> 

[Medium] FIB notifications

Agreed: only the first alias of a prefix is notified, so changes to 
non-first aliases (DSCP routes) are not seen. v2 documents the limit and 
that DSCP-specific routes must not be used with FA.

[Medium] B53 and the backend deciding differently

Both now accept the same compatibles (patch 6), on a BCM5301x switch. v2 
documents the actual conditions and what happens for an enabled node 
with another compatible.

[Medium] GMAC3

GMAC3 is not probed by bgmac without a MAC address, so its core is not 
reset by the driver. Whether the accelerator registers are accessible
depends on the bootloader state; v2 documents it, and makes reading them
the first step of the hardware validation.

[Medium] nftables ruleset

Agreed, v2 matches the protocol before the NAT statements and covers TCP 
as well as UDP.

[Low] kunit filter, commit message

Fixed in v2.

pw-bot: cr
-- 
Florian
