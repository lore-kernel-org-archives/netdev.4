Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422998;
	b=ShZjrL55EgzUVyjQQZURSulTXVKUcy0V3JfRYVU/0uAkRo82Q1Ihd7JrPmbrSLCX0FEm
	 wQNgJc5lXZhUVWc6WcPmiIwxGtwrjkNNpfMWDR32ZJgAVJoWk+GmyCJpJkDxMj9Icw3HU
	 uXobM+BXEreFRewubXZJVKjhJnEEPxV8vg3UjZyMMyWEixAFyGVwVs01cDsMpBanyGr7T
	 LosIkInjWKAn9xzAexr4UjS5FpbIqRad+nn48fYnvX6Taut1fFoD/olt1RCBb5oYwm5qu
	 T0qOz2R3/6FvagRoatycTiPk5LQ2AH4V72CNN2X2nRF4j/23audOx7vqdktIbQYcRIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422998;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2OX63kgV8CtpEDOwgqN7q56BE5W0V+/Nb3DnFHGJsZ4=;
	b=SaZALOz/y3FUOlva/OXKiHS+LHCayQdTT4nNT6l8jmPeRe6DQN5k/g0BJWHX3KKCKzE4
	 UD0NhmY9q/o93A0X3u4hhfD21fDJOhzKmWlf/wsmayNq0oNgybbFsfzFS5eyAzw4oSnQX
	 yHtZaNq1anjLx/fT95JhD66zvEuR8URUDcsz+cL4us7APORl3hfu64pfMr+J/LdwhZVuF
	 V5kUdUYkYlP+YyVGFfnOpXx4yQPRWhp1YrcO6j6lTRRTGmW3BT7Xe/99j4edaBkCL1z/b
	 K1sDZlOCXG0M8UMeQYA7IF/VTZ2eeNpfVRBKPrxFU/v4s+w7ZuS+vkDkVXxUrDsRuVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T6SOaqwF;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799E606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3799E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T6SOaqwF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795422998; x=1826958998;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=f57rKML2Xyrc1MDHRFxcs8lQhQu7zcxkpMHWNl9Kgzs=;
  b=T6SOaqwF82cLkBykedKW7YgNwWFhrhD0hqB2yEaqmqbkQtimiChuZMB9
   VTHQq2ph4SkA6N4jMFVnJU4ZYnSw/fVoGdA2wLQjsoLnLyMAOhY7QUEh7
   M5lpH74UMNDS6FbugfxlB1m91yx9QtjC/SJAucBAexkM+M0874d6LFbgj
   KhB+Djd8zcSFdOs6VtG9r4wFjMLWoOcLKnoEDeSWSKR6B9t5X/NjdZOXW
   q5tflrTz7r2d/PKcXFxKimYCyAr0+R4gGvD3idlYngh+mrB9aVgpfJeLw
   JqhdSwMmyZcBsH9AIZLgNNx5EpMvqL5FhK65GjiW/GqRIyZwhetH05Flk
   w==;
X-CSE-ConnectionGUID: 3yojb2J7S0WjsqsEPN0F9w==
X-CSE-MsgGUID: 8o8Pl4FGQe+XSfheZ/F7/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4234543"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4234543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:36:38 -0800
X-CSE-ConnectionGUID: QrrBQgBBSgStlcLHxb5M5w==
X-CSE-MsgGUID: +FOa851gTsSJxt+KLjFA3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11016022"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:36:38 -0800
Received: from [10.241.178.60] (soc-5CG1401QVW.clients.intel.com [10.241.178.60])
	by linux.intel.com (Postfix) with ESMTP id C851320B8CD1;
	Mon, 23 Nov 2026 00:36:33 -0800 (PST)
Message-ID: <a62bce53-a307-483f-86e9-00949b142e9f@linux.intel.com>
Date: Mon, 23 Nov 2026 16:36:32 +0800
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
To: Kohei Enju <kohei@enjuk.jp>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
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
Content-Language: en-US
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
In-Reply-To: <20260429091632.26509-1-kohei@enjuk.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/29/2026 5:16 PM, Kohei Enju wrote:
> Since commit 97dc7cd92ac6 ("ptp: Support late timestamp determination"),
> skb_shared_hwtstamps may carry netdev_data instead of a resolved
> hwtstamp. AF_PACKET and TCP could still read that storage as a ktime_t
> and report bogus hardware timestamps to userspace.
> 
> This series factors the late timestamp resolution logic into a common
> helper, then switches AF_PACKET and TCP to use it.
> 
> Notes on SOF_TIMESTAMPING_BIND_PHC:
> The generic socket receive timestamping path honors it, but the
> AF_PACKET and TCP receive paths touched here haven't implemented that
> behavior.
> This series doesn't change that; those paths always resolve timestamps
> with cycles == false and preserve their timestamp-domain semantics.
> 
> Kohei Enju (3):
>    net: introduce helper to resolve hardware timestamps from skb
>    af_packet: use skb_get_hwtstamp() for hardware timestamps
>    tcp: use skb_get_hwtstamp() for hardware timestamps
> 
>   include/linux/skbuff.h | 11 +++++++++++
>   include/net/tcp.h      |  2 +-
>   net/core/skbuff.c      | 27 +++++++++++++++++++++++++++
>   net/ipv4/tcp_input.c   |  3 ++-
>   net/ipv4/tcp_ipv4.c    |  6 ++++--
>   net/ipv6/tcp_ipv6.c    |  3 ++-
>   net/packet/af_packet.c |  2 +-
>   net/socket.c           | 27 +++------------------------
>   8 files changed, 51 insertions(+), 30 deletions(-)
> 
Hi Kohei,

I am currently working with Vinicius on a fix for wrong hardware 
timestamp in tcpdump 
(https://lore.kernel.org/all/20261111053728.2611070-1-khai.wen.tan@linux.intel.com/)

We have came across your series are also fixing the same issue. I would 
like to check about your current status on the v2 for this series, we 
are planning to implement your fixes (skb_get_hwtstamp() helper) into 
our patch, so we would like to ask if you currently have plan for the 
series v2. If you not having plans for this or don’t have time for this, 
may we include the first patch of this series into our patch, the patch 
authorship will still be kept to you?

Best Regards,
KhaiWen
