Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447614;
	b=MtPUyabGZpOblmqtcKZFoRDV7gLiRYKGbh1gneIuB5tAUyvgjAw6iwoDKXF+XR9f7VNb
	 hqFCnmf8Ey1s+BiC9Un/Fyvw5uPiHBynhO0WGgo/IfifOwFpq2Svo+zcSO9nYxb0+/FO3
	 qK7ZUhpAyvXu9Opy7LEjpu1ru69tmgS5+ZC07iRaaQpCHqsPgMfCyLLpcdrwe3WuLhkMK
	 vHW3V2tK+at++d5cG/t6SstcoY2q4PJl4g31bDJVo6k9znE5zMNqACEDeCavauqceTTCk
	 PS/1/7bXyBBoUli5v9hJkDx+BkLemTZoufgFUkHYoOuKp+TzksnaZp7YWlW1irxAoLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447614;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
	b=mrmQgoZ3cDbDGKzu7YS+NxEBr1QwKx68zwL/hT6aqmeyQA8cVqQ8W7c++sdweK2BspDk
	 92PXaL09tjS4fPN9dWXaEDAMyggnVs/uMGpo3MKjzJoG08vtFqjVBp51oXUTUqn9IupvK
	 DreQe7Fxv2j6PVByt1I5NLBC9uY1ML4JdMpHD65wWwpmMlDs93W87PPnrFq9zzj6b2sI0
	 8XZMNOdBv8ag28cXy87P9DZYG4m0nX/JPz8Kb3nE14Aop8M5IUFPzycXPWOSnIkGXvSaz
	 i4yQVluBe2nsSCS6tZuc0MrHcoAUlmS0pfSHkcMDnwQzGx+f/T+RahoxlsVqw7Wjeeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnueAwNr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hF5hXOlS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6C606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnueAwNr;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hF5hXOlS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795447613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
	b=AnueAwNrqTs7P89QOMW2kQfUTrXuc5WPVrAW3jYxRnpEVerMHn1BlQTYG56U2QqfKdcQ2D
	P/am+V/yvHyDbpyZ4Pean1RaEeWeAw86q7NSChWmjxoDPfbox4n4Pa+8ryOOT2Ld66tSaa
	EYlGl+X1k6nJhOvHXDBdtB8yApcJTp4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-hisUNvv9Pg-TLR5PIWMSqQ-1; Mon, 23 Nov 2026 15:26:50 +0000
X-MC-Unique: hisUNvv9Pg-TLR5PIWMSqQ-1
X-Mimecast-MFC-AGG-ID: hisUNvv9Pg-TLR5PIWMSqQ_1795447610
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so2066085f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795447609; x=1796052409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
        b=hF5hXOlS/r53HlAUexTYyuZCe6q+EPACFaEn07MBUB3FUgImxS8OGvnUnFynC/+Kmw
         MZwpliHGKotqh8eHVnyXGSBMvpE35CRKis60/xzUiJrRPjl+xWjq0CSYIVDxDxZxa7cP
         oat3Or1LS4+AuREgizvIEhymggWOTvt20x6mfs33HhOcMhxRuQwNka3lJK6W8TzXwcYx
         wxj5Nu8QCVDeWyO0FqPQ1bAUopPnKZWC2dfZ16uj1PTBXd31+AWF6H7lzBc7/5iSrJeY
         UGUGDi9dHYLslbohZIGmcmJw48h8lxk2DswnbuPX/Qm6B15rO0SFUMi8UgzcOggKsDwJ
         LvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447609; x=1796052409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQJJzGiJFbu5GqtKUpKzK6SjWyz/RV7/Tzi0AWNe2OQ=;
        b=AWZBUxs8GZjRxG/KVwzKSV+TH4CdHTgV42NUcs6iySXhUN+hg9MsgDn14umdS7400q
         Oa+jlr7nVix9pCGiEd3fgxlpeGZQvyk+v8YmpjADYTb+FQ3ytHabLEHNzn4gAliDHhLj
         iZN0Cnpu8cQROeN1+PZoLpSm/AGlqD5NBYNLRRShowk9gqwc5lCHH8nxwZhVsi7exDai
         b5ljJJeZEuGORjndWdEF6S4SyDL14DD0/V/Z4WRQB6k4CXv7P+CHEH8Ke9/RsaU/pJmr
         SE6Hw7Z90maUPoVsRk2ILsnzVMEt8BpOurdwujoIgdw8tKjjpD0Lcv9Co6B7ytunDwND
         1syA==
X-Forwarded-Encrypted: i=1; AL+hErEhsGs5/bhwJeGprzsFK+O6Wvjmg0W/YPOj7IKov5NR/78bm6HKHlihLGR1Kqd85nK7PCmw7Jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xlrUDl5gxmwr9buS0DDPSZN+zZoHea+1kxEEydbcgA2RNPQUP
	+hp80pUa8vsoWFxTXkf97P41ahvn8uXcX6aBaG1LjDeda6d8Mh68JbT7rZLdbdNzsK8YvI/I8y+
	1DNS2mBdoogtj8aKHlV9GMiSVAgtDBFmD35l2oxbMPqhO6DMOJh7bd2mpgw==
X-Gm-Gg: AZFdTZeWWv3IOh4ErAgiyBV5EfByQrPV2Au54JzOAKjGW1mBO0eOjUjQuxUKuzItowd
	Am3L0fjrH7PMrrwLp2MpCHeAhEFdlGCuHVqlLhZIJpepJDocvb3PcNDdjRAeO0ik6PHWFkBwubk
	4j1cngoX5Voqh+Wmz6m1MCDaQbtKqpUF5VB5YghZ6RWDyzK/X0qOlIlxPLKK/ozMVo16Me+ZPMG
	aGKjAQESSN8vXcB3hVXF8B6dFux3Pb3qfWLGJci6cKYedHmbdabF5leqWhl0glnx+d99FAMZ64e
	t/PWo28qrBFml/oS/GFPX3Xea58KQh52Ly+VseuKC7CoPy17JvX1+S1zJR/5scxW3nhp69WyjbH
	gbDTABRFRoZ01EYDiqyOUuQJyX8XH8lsNlJBwLCG3cTc0YF3Wzgpb1EFu9s4XJJxF5d9TOoBSi4
	4Mt9Fvciy9/phXJndqg3OrjVc7E6sobpzboxFm5/J2pYem
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr273241925e9.8.1795447609616;
        Mon, 23 Nov 2026 07:26:49 -0800 (PST)
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr273241195e9.8.1795447609102;
        Mon, 23 Nov 2026 07:26:49 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm24250026f8f.11.2026.11.23.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:26:48 -0800 (PST)
Message-ID: <781ac9ed-a6d5-4b6e-8598-36938e76c34a@redhat.com>
Date: Mon, 23 Nov 2026 16:26:47 +0100
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
Subject: Re: [PATCH net] net: openvswitch: don't WARN on a non-IP packet that
 needs fragmenting
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
References: <179492834266.3639154.14679778183890331729@gmail.com>
 <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
 <179502509517.2983267.1652158471891914135@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179502509517.2983267.1652158471891914135@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 19:06, Kyuwon Cho wrote:
> ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
> with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
> userspace, any ethertype can get there, e.g. an MPLS packet executed by
> an unprivileged user in its own user and network namespace:
> 
>    Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>    WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>    Call Trace:
>     do_execute_actions+0x580e/0x7380
>     ovs_execute_actions+0xd3/0x3e0
>     ovs_packet_cmd_execute+0xc21/0x13c0
> 
> The packet is dropped either way, so use a rate-limited warning instead.
> 
> Fixes: 7f8a436eaa2c ("openvswitch: Add conntrack action")
> Closes: https://lore.kernel.org/netdev/179492834266.3639154.14679778183890331729@gmail.com/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
I think this better suited for net-next. No need to re-submit.

/P

