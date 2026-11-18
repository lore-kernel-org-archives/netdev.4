Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997508;
	b=gRbCarQQOdWs6ax2Ql+rojbVrORErU9jLr56CmKc2+VV5SI3+CLN//dlExzQe8lxL4C5
	 cUwp394ZSElzTg9GEyEvIIMaGwC6RBaKm7OFzxn7fXLkbnVgcqKO4uHCu8PGn2FNnZQLB
	 boQf8J52+SD39XKk4W2Dv0bk7TC3xSol8pGLlfWFOYgvKHknnL+Gr7ikLEviFMya0lutC
	 uS9ZB+ZuiMFtpjB7nFSOH6jXdTEJ9PBX6/xbdAJsp47jjqho2EieiZqg11Bzd2gaGVl7n
	 QfObNZmQ89IQgS1dX9HyiGIpLNqLM2ZKFqFS/1fb+EQnrscSOjwyL30Qbbq/vNV+wyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997508;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=Yhigk21UeHnX3LFKE02WJlX+yu75OJpAsHrP2ixijWE=;
	b=HqYQ6EWeygH/NdAgslriO1hR+8z+Ul6cAONddagCiyVDxf9gFPLhmcw/J5ycyRUyD+Su
	 qCuJMUUMym+imliswpJH827zOIXpOL5keK3JmRogpsX0Ohlq02Dwg1G20igWLcPJv/2cN
	 5SF4lPfaplucprWSRwG9TkmQ2JbSe/0neyGhTyM7D/MR0eOIE9yRTkGoNvgnaYO6MEIaw
	 YO8d0Co6M3Sy7ftJZ14/w2i6Sn33DNHOQg6TZLQ9Z3iFvGin+xtuGijnfzjVGsMGHreyy
	 KPoAQU58SG3zBavD278wrSogMoCF/9cq2V8/6OLFt4L+58E/ErxHEa5x343iP737DBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NefQZF7j;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2E1606A32A;
	Wed, 18 Nov 2026 10:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF2E1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NefQZF7j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NefQZF7jCQieaZJKEurUuZjqrM6zvK+V0mrRU1WNN7RnvWkzTp6RQeG1rjS4vzG/5dgEgy9ybc58f
	 WyZTRRu7kbrprdKGZ2jc2Ikh56P7UsNaBqibH8jNJas2S+m6OViJrZyj1FjBVFWAqnbGOlpOtE9k8m
	 kNXYlzfzuiCxbvEo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afd7cff391-10eb7;
	Wed, 18 Nov 2026 18:25:04 +0800 (CST)
X-RM-TRANSID:2ee56afd7cff391-10eb7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.131] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afd7cfedfd-d3b0d;
	Wed, 18 Nov 2026 18:25:04 +0800 (CST)
X-RM-TRANSID:2ee96afd7cfedfd-d3b0d
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com,
 xeb@mail.ru, yana06070@163.com
Subject: Re: [PATCH net-next v3] ip6_gre: fix changelink conflict checks for
 L2 tunnels
In-Reply-To: <179489968486.3136.18372818760197436344@kernel.org>
References: 
 <179455350258.84965.17518172977020586093.ip6gre-v3@cmss.chinamobile.com>
 <179489968486.3136.18372818760197436344@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Date: Wed, 18 Nov 2026 18:24:57 +0800
Message-ID: <179499749739.1141732.10101346678312526903.ip6gre-v4-followup@cmss.chinamobile.com>

Hi,

I reproduced both cases and addressed them in v4:
https://lore.kernel.org/netdev/179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com/

Metadata updates now go through the duplicate check when their receive
parameters change. Moving one onto an existing ordinary tunnel returns
EEXIST, including for L3 GRE.

Updates that keep the receive parameters unchanged skip that lookup.
They also keep the hash entry in place, so updating either device in an
existing ordinary/metadata overlap does not change the receive priority.
Both GRE and ERSPAN changelink paths do this.

UML tests passed for all three kinds, including received-packet checks.

On Fixes, Ido asked to drop Fixes/stable and target net-next:
https://lore.kernel.org/netdev/20261030151629.GA85001@shredder/
I've kept that for v4.

Thanks,
Xia Yan

pw-bot: cr


