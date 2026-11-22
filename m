Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382189;
	b=lUCNtcg34foFr4lPehuy0bt5gpqW2q2pgxnHujAlmVTDrx7lTBDpAwVPqzmxmnEuqVse
	 k11kgXNIgAPpZ92z+wGTdW2y4WcKCrpNVI6Mg/C9LAk2DbO7zp93YbdemA6/0av7G7wc8
	 /u89hsvIhsS7nb66VnhYlYWGyJMxGKT/JPhV+pHr+cHo/Ax29C7oPLpoQblLDA24IJeR2
	 KEZ+nnDgBH8vBb1f3fyFzAtsiMnk/SKu6PP7O1uSa/iySab1AlA3e5LPmYnrpx3zn5Zbw
	 aP94COc5fTmzAkk0W5LwPa2t7hL7Rhobr3QW7+tT0iCrOkMJaarTvmxNgtJY9YRgybg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382189;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Virus-Scanned:X-Virus-Status;
	bh=epyfVPQGGDtBJHy2eUBihSmpp7eBVfrzlTOZUIzdOIA=;
	b=zciitJfrVIlt9sRWFQ1hNEGttlyQvb21cxMJ8KX3B2Frtt7EQY/9Xp59Eh4UGMDmcKtz
	 EesbOrfugMAoF1/TZ8cRclfruYtzPjmWgPAeOC3DRWLAp8XiOcwEiC/1xq5Hfscw0/PXD
	 TJYkrXHA6nX2tmPBNSjuNv/zf47fKe9fhTHtlCZ5SeU2i6f/MxIeC50UzETwuZccCOuH3
	 NTGiSPVOrp6lEOgn1eoqV4pqT7Kj2UB6SY3a+dDcQ+kxEp6U/MoJiOweCrvgTKSL5Meto
	 mVdxu8mzZ7u0kPmU09GyEfNDGCy6HRuxrGUWJ2K6HwokHB+fhBz+BKq2PIqpQoYKaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=65WSAp8h;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=mtSPPvRo;
	arc=none smtp.remote-ip=160.80.4.36
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.36])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F9C606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=65WSAp8h;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=mtSPPvRo
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AMLFegr001909;
	Sun, 22 Nov 2026 22:15:45 +0100
Received: from [192.168.0.87] (unknown [101.59.90.84])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 0C521120628;
	Sun, 22 Nov 2026 22:15:35 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1795382135; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epyfVPQGGDtBJHy2eUBihSmpp7eBVfrzlTOZUIzdOIA=;
	b=65WSAp8hsPg/wXx60HMHEHqKP+Nyf1hMtgXYfGapgrK+CPSln4qgONbsp+YtjMdEIh5X6f
	68D9HRvFrRw6GKDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1795382135; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epyfVPQGGDtBJHy2eUBihSmpp7eBVfrzlTOZUIzdOIA=;
	b=mtSPPvRonKLpvHzoBAW2Topx5ICr3JFPnjHFbvB07H5b8PCAIZQwtQCtklHdLt7mamqzsn
	lmrDiAUM4XZKOl8OHQM1Pe2kFz3Kv4+MGZyfaXuU0igUlhmu7Tl9AQxTRTAF+BPjanV7fE
	ghyuSnWC+2z8rXHk69965claQpW7CuXv0itlh+oeVdkjDutBli8/o6ixQIw7s2DVJ02Rkv
	UJos06zGrBJGwEfNehzO3fTqTBbuSLCvNFExA22ZAimVKB76WKiF9c5d3udu9oqdJukg/X
	VBtUie0Q5W0KmQJJsNlbtWjOPuePFGuQN7vVqo4a+TMMM1X2oKlD+nd9i0EBbA==
Message-ID: <b743f74a-dd3d-4a47-9dd6-079213e4a048@uniroma2.it>
Date: Sun, 22 Nov 2026 22:15:29 +0100
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
Subject: Re: SRv6 L2 VPN discussion
Content-Language: en-US, it
To: Robert Peterson <robert.peterson53@gmail.com>, netdev@vger.kernel.org
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>,
        Justin Iurman <justin.iurman@6wind.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        David Ahern
 <dsahern@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Paolo Lungaroni <paolo.lungaroni@uniroma2.it>,
        Ahmed Abdelsalam <ahabdels@cisco.com>
References: <CAD8h+Ut1JHeg0gyB7pvZfQHhkkj0dAT07WuYgLJSUDL+A2QSSw@mail.gmail.com>
From: Stefano Salsano <stefano.salsano@uniroma2.it>
In-Reply-To: <CAD8h+Ut1JHeg0gyB7pvZfQHhkkj0dAT07WuYgLJSUDL+A2QSSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On 2026-11-20 18:14, Robert Peterson wrote:
> Hi Andrea, all,
> 
> I have been testing the sr6 series on a net-next based kernel and would
> like to help get it merged. Summary of what I did and found, and two
> thingsI would like to work on, if that's ok with you guys.
 >
> [snip]
Hi Robert,

thanks for testing the series and for your questions.
They are the right ones, both on the MTU handling and on End.DT2M.

We are about to post an RFC v2 of the series on netdev, with several 
changes to the code.
So it makes sense to wait a little and have the discussion on the merits 
there, on the new version.

Your help is welcome.
Testing the RFC v2 will be the most useful thing in the short term.
For End.DT2M and End.DX2V let's talk before any code: there are a few 
design points to agree on first.

Ciao,
Stefano and Andrea


-- 
*******************************************************************
Prof. Stefano Salsano
Dipartimento Ingegneria Elettronica
Universita' di Roma Tor Vergata
Viale Politecnico, 1 - 00133 Roma - ITALY

http://netgroup.uniroma2.it/Stefano_Salsano/

E-mail  : stefano.salsano@uniroma2.it
Office  : (Tel.) +39 06 72597770 (Fax.) +39 06 72597435
*******************************************************************

