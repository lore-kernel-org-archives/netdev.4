Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711633;
	b=BUAS+diYsaCg5tFZPK+K1e5rgWifD7vk9ow506dS0hD+Pg4cXgRM5rYVo93Oemta2kKx
	 c1iQVvGEw2EFCjdNwzYV8iQ/XTd3rP35pUWTs6WjnCh1TNVjq0QlSmV227i31LtBO5Qkp
	 5lpCNnMljh4eGtkt5/9MND4umkO09s119Abk3OhYteWqkP5klF9By2B5RjThhrks1qPnK
	 MvCQqEAaqRUvWvIgsSG00DR+NfJ/YproNyY9Wtx8MD75CA70mWc/ischjH0M+NJGAsw1A
	 l9KIoj4E4YCegm+SvBrmvHsw+X+ky7UUe/KQurxeG9cROv5DrITzwgHdvrzLR72JE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711633;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=lWRuXWS/aqXGtXTETqcdhLBaPFLRC0d249HFAaraIUc=;
	b=Lv4wkMXoXhuAGdOqrTG6m/qhuyeo442n3XAY3hZvlkR7DF5dNDsSQytDhovqXxODEqP+
	 BL4yXpXdGvVpht5H8B6wdP1duQDZe9/YtpkxkgtYg3LcsLjOfUrMIvdYxOea+hq7x/EIs
	 pJzxbFtuS2fcJKJImhKJyAe91X+mb4sp8qzWdr6uudMjlLQQ6ZrJn4g5PyczgS8cnUbex
	 vitZkMj4magfkDWFcc6NRiqvw9Apd8xsHwVtHM5pc0r7euXy7Ygq1mLikuJgOiu3tv06a
	 JaNaqJlUIQ+jbDZP//a6hGyyVU73anM7oEh48ub5BFbVWVqqWGc3Sd7QTDQGFmQiInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=P0guuGLV;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB24606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=P0guuGLV
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jb2Ww3Rb3zWl;
	Thu, 26 Nov 2026 17:47:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795711628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWRuXWS/aqXGtXTETqcdhLBaPFLRC0d249HFAaraIUc=;
	b=P0guuGLVpgLBvzLDXrCILahxkKXmlnw/B92mliXRXuFSQWmKSXUmY3KKDv4fHz+hJd2XuN
	cNpzpOGqVxNlwnOmjZ2wFqxuUpZsP4O3xAVAhtMcYUYwymQ4c+ed3R4sIUdQux+1Nv0yEI
	gqulgAYB+/GsvcMJjEVSAgdBf4WOG/4L0H8PUrGjrQSVBJcunQXGLfEqcng3wK+MRFyztO
	kIrEiA/r9+pOKieBXIgks1P+fLl4CGxMxKWMkFO/onea6y0qwb2AlwcrlYByGyrjQMtGVm
	wIx6QYvCFZ44nIVrMJIlP6lgUgOFLFOvQTrMsu3C7nl381qDYknHWDg0jm3+8g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
Message-ID: <7fd55e22-d8c5-4015-a449-471c4dfabd2a@mandelbit.com>
Date: Thu, 26 Nov 2026 17:47:06 +0100
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
Subject: Re: [PATCH net 0/6] net: qualcomm: rmnet: fix TX aggregation and
 teardown bugs
To: netdev@vger.kernel.org
Cc: Subash Abhinov Kasiviswanathan
 <subash.a.kasiviswanathan@oss.qualcomm.com>,
 Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniele Palmas <dnlplm@gmail.com>, Taehee Yoo <ap420073@gmail.com>,
 koen.vandeputte@citymesh.com
References: <20261126163219.1744750-1-antonio@mandelbit.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Organization: Mandelbit SRL
In-Reply-To: <20261126163219.1744750-1-antonio@mandelbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4jb2Ww3Rb3zWl

Hi,

I just realized that patches 4, 5 and 6 duplicate fixes already in 
net-next, which I missed (they are not in net yet):

   4/6 == 0af0e210b5bd ("net: qualcomm: rmnet: fix TX aggregation 
teardown race")
   5/6, 6/6 are covered by 4f89bcfa1e16 ("net: qualcomm: rmnet: avoid 
stale VND access on TX drop")

Therefore they can be dropped.

Patches 1-3 fix bugs still present in net-next, but 1 and 2 conflict 
with 7bcccc40cdb5 ("net: qualcomm: rmnet: bound TX aggregates on 
byte-limit update").

Since those related fixes went to net-next, I will just resend 1, 2 and 
3 rebased on net-next.

Regards,

pw-bot: cr


-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

