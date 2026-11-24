Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487229;
	b=t+t/lxYS3Ke/AFXYklNGBD+PBA6ijlW44uDtB4h47ZxwGwOFIedNObhz323+4n/qB4tw
	 IhuI0GqHf9+8ALjndEsd9IoxmoYLC3g0zC/kCf88fnVi8oiLmVTIg736KgdcmrPH8GeKo
	 cqNgjDNNf4PQLAvogXN1LC6G68Jqi7n3EVg0uQuPiYGNScavefT60lCyZLz6U1GlSC/gJ
	 wx6qSbq+B0+vJEP+wKRIUvMPXaTUR3OucF7Vusit+ePLiakprnHf8Txlba3NPz5vZyqHN
	 qITCBLZtesxGVSmBSwnCQOyizyzhBu7N+2/Y9QtMvgurnmKSE725ex1lXjeY1QkNdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487229;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=biDlCWEAViFygZmsfqd4vibtJ1ZYZE87r2fIceCMj6o=;
	b=rN88P7iEoIv2jlGhisl77I7+PqEAlYiR5NNPVDe1KQfWvjUk1WwYNMEG3d7LxQxBwdGv
	 3IfsHYnkqO/WjDUA01RZGeect3QIYkv52s6RLiDJ4PNmWOJ7KWQ7QT/92GAwcRACYxp+E
	 7MDNdgqXsACiPqTgbV4EcvUcmqxZJthUKLep0XoD3sD5BUA55+a8oSTEdCfiTCmuTFaAe
	 zl6XKcvPValed9VG7ppMwX5Snj2cDIPkCnw3bBQcCWoBbWniJ/Gk9rvutiJpC1MY663n3
	 5Nr+R4d0EP6dL1Us+4nk2oe+P99jLQ0+/siwQP2ObBO0XMAhCSgsSB3HpBzKKWsrpQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QX/S8IlQ";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AAD606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QX/S8IlQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795487228; x=1827023228;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e/TlCoRsBj0ERFSxrd1P88I+Vk1tvkqJ0oJwRQJHJv4=;
  b=QX/S8IlQ3u+3k4/qOcN+HmsNZuzwbIzIqhtlTWBkU3F80wAFyXFm6QKr
   H8NkpAnBrJVa5u3Su96fGJt3h2JDUNsJKu9C/jyn6clhEJrjtV4438yJU
   0FuBHuUnz4RlMhgj17agPhz7OlhSXrVaHT2nUCzVlBpmAUQMBf/pzWM89
   YA76VAYaW4zOA+WtpFwx52WLfSvJoAHCuE3JZEL/JRvS/zziJWPwfyXuf
   Uugd//CyXKveY5YHHXlFP+DFAXwgxx4YG+BJ8T7qbOcD1G5fuZ6Lfg8J8
   xQd/sE0QE7XzXd15owwUysLzOuaC62azY36bSEenIx/wa2mz0CxiTW4gK
   w==;
X-CSE-ConnectionGUID: mgclZDlmS1CxzqMU7VIpQQ==
X-CSE-MsgGUID: 4T8hjgQsQuuG7Rwz6BjRGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222640"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4222640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:27:06 -0800
X-CSE-ConnectionGUID: O39Y297wTv6w1jAti8WEKQ==
X-CSE-MsgGUID: 46J6RiOsQkSUc8lT0JQiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11565525"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:27:00 -0800
Received: from [10.107.17.224] (unknown [10.107.17.224])
	by linux.intel.com (Postfix) with ESMTP id 7D25820B8CD1;
	Mon, 23 Nov 2026 18:26:56 -0800 (PST)
Message-ID: <be488576-0143-4c38-8259-6947053d55e5@linux.intel.com>
Date: Tue, 24 Nov 2026 10:26:55 +0800
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
Subject: Re: [PATCH net v1 0/3] af_packet/tcp: fix late hardware timestamp
 handling
To: Kohei Enju <kohei@enjuk.jp>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn
 <willemb@google.com>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Gomes Vinicius <vinicius.gomes@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 "Tan, Khai Wen" <khai.wen.tan@intel.com>
References: <20260429091632.26509-1-kohei@enjuk.jp>
 <a62bce53-a307-483f-86e9-00949b142e9f@linux.intel.com> <awRbgl7vlFO-c3Q6@x1>
Content-Language: en-US
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
In-Reply-To: <awRbgl7vlFO-c3Q6@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/2026 11:31 PM, Kohei Enju wrote:
> On 11/23 16:36, KhaiWenTan wrote:
>> On 4/29/2026 5:16 PM, Kohei Enju wrote:
>>> Since commit 97dc7cd92ac6 ("ptp: Support late timestamp determination"),
>>> skb_shared_hwtstamps may carry netdev_data instead of a resolved
>>> hwtstamp. AF_PACKET and TCP could still read that storage as a ktime_t
>>> and report bogus hardware timestamps to userspace.
>>>
>>> This series factors the late timestamp resolution logic into a common
>>> helper, then switches AF_PACKET and TCP to use it.
>>>
>>> Notes on SOF_TIMESTAMPING_BIND_PHC:
>>> The generic socket receive timestamping path honors it, but the
>>> AF_PACKET and TCP receive paths touched here haven't implemented that
>>> behavior.
>>> This series doesn't change that; those paths always resolve timestamps
>>> with cycles == false and preserve their timestamp-domain semantics.
>>>
>>> Kohei Enju (3):
>>>     net: introduce helper to resolve hardware timestamps from skb
>>>     af_packet: use skb_get_hwtstamp() for hardware timestamps
>>>     tcp: use skb_get_hwtstamp() for hardware timestamps
>>>
>>>    include/linux/skbuff.h | 11 +++++++++++
>>>    include/net/tcp.h      |  2 +-
>>>    net/core/skbuff.c      | 27 +++++++++++++++++++++++++++
>>>    net/ipv4/tcp_input.c   |  3 ++-
>>>    net/ipv4/tcp_ipv4.c    |  6 ++++--
>>>    net/ipv6/tcp_ipv6.c    |  3 ++-
>>>    net/packet/af_packet.c |  2 +-
>>>    net/socket.c           | 27 +++------------------------
>>>    8 files changed, 51 insertions(+), 30 deletions(-)
>>>
>> Hi Kohei,
> 
> Hi KhaiWen,
> Sorry for the late response.
> 
>>
>> I am currently working with Vinicius on a fix for wrong hardware timestamp
>> in tcpdump (https://lore.kernel.org/all/20261111053728.2611070-1-khai.wen.tan@linux.intel.com/)
>>
>> We have came across your series are also fixing the same issue. I would like
>> to check about your current status on the v2 for this series, we are
>> planning to implement your fixes (skb_get_hwtstamp() helper) into our patch,
>> so we would like to ask if you currently have plan for the series v2. If you
>> not having plans for this or don’t have time for this, may we include the
>> first patch of this series into our patch, the patch authorship will still
>> be kept to you?
> 
> I'm not currently working on a v2, so please feel free to incorporate my
> changes into your patch. I'm fine with either keeping or dropping my
> authorship.
> 
> Thanks for taking this forward!

Thanks for the response. We will be including the first patch 
"[net,v1,1/3] net: introduce helper to resolve hardware timestamps from 
skb".

> 
> Thanks,
> Kohei
> 
>>
>> Best Regards,
>> KhaiWen

