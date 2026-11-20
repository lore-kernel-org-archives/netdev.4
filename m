Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133005;
	b=l9A3aiiM/BeK0wmSZ54WOVaGzWJvpVqyG5DYpVKPT1X+kv+9bI4X6l4FSEEx+1CR1Zvj
	 YRMUkbmYEVi/zw6uxrEwxiug/uktfUIs2V5lqlQeqtiA4IA3rPGc/IEh64c4WNo+I783j
	 dHSPPc4bJUfHHY+neXLqWGAkQPT5I+rIJj0ILZIWtzsRv5PzAaBuJ15s0wg40sEqUJAlq
	 aaw4ojirQRcglvzLncUBwK9ga9Y4psx0LHs1ONfUmPuzte3yo4P8x+J2yrmvSh42xf5cA
	 tUBcucuzMvmPHAAS2adpq0/YsAka/djDMABOAKRBJU6KrA1EFk284ent19V+J6J37SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qX3sjmsKWyJLgJKQz7CR3/3TQ9oKhkHisfSxdP4egWY=;
	b=ZRtEF806BnzKn7oH9Qdji/lQPK21/DDGLmfPvjSzNfFv+l91p0cAjl4bd8+pv+50OL13
	 pykAR28zgdMKrSGdetyQtsyeJTwBqF0Hgd3Ounogf/vauRTb1sPEL8bjyyA1NB6va5zPd
	 KzLpjijVCay2QnjXWJuAvKFefSp6Yziwt18Prxqqd/WvYFGzKMY37/1gugeoyZ7jH66AJ
	 isf0t9BMM5e/B2rZiNoxBv2hzTQIfyEpUNbS+Sye2HnSxWLzLPHqOKXDXfWpM/56Opj0b
	 6rUUhAsjmNdXlq11Zckreg3k35JmAFY8T1V2KLxevZaqjxtLKd8pkcgqVcPiGuh1jqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCf1ah2r;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CD606A330
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCf1ah2r
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9496400270fso31790685a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795133002; x=1795737802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qX3sjmsKWyJLgJKQz7CR3/3TQ9oKhkHisfSxdP4egWY=;
        b=CCf1ah2rUECxTd+CtbA6vuqAb10VO+eDjDXTYB1a9zilYGbdU37tb3+N1yeAPobi30
         dcyu63Q5edMJ9S4lGe+Dx0X1G0ct20tWnsQef+en9swzcaua7AKXV6ERLS3XWVSD5jZW
         n/w2+4mlCjqfvJ1wl6+oZyXKAd7T7XD7iA/yCQ8ZalDWLIm+D1GwVLA+HvB/zwtkll/P
         6nGi9wjoqhzVVUXYvY2LOolFRbEslxOs+vlVZJ++tbN9fIJEq3TLiS1ZbvWB0Zz9NDxg
         LH6nAdizTPNmyMF5OdCBTC5MB2iYZHa2F5bkFGu1FnX1zCL44IuX9o8rlv4BP1Fg25dB
         fNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133002; x=1795737802;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX3sjmsKWyJLgJKQz7CR3/3TQ9oKhkHisfSxdP4egWY=;
        b=x0onhTVd9auxbrbfBd3ycEqnU6LHeI9n9gRiCGcPyTlfuG6cNRIAi7nPorG6UW3Dj4
         +exmeeVN9kqeHc97YCz5Nn1TJEzqVqo2BCMKNwAIxG02uMSlqL1VtQ9hUjU4Xe1YzL3u
         FmMsFElOvFL2Sm+43dVI2twd+7YMaVvGSA+scGtgu0YlfqAWOhbiXXuOyXXJVwmsGIDF
         CRaZjDGBH+B2t0BVZVJuJnewukCmH1N7SmosFHGWa7cEGZ/UqW57pdNPV8gZaMppc5qD
         /d5CdUsQtBcRIrPuTSKKOFOwTg+blgtsw3Rcio4sr/TVBsumBYJUIn8tqWNuGSP8G9JC
         FBqA==
X-Forwarded-Encrypted: i=1; AL+hErEAdlXYfRwGOuuYOMjqDmdAQa4e+ayCg0SmKJO3pTnI/XXLtFfq/7GC3/ZNquKP44lh1oNDUl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lHtwBDC09eKI3j4erufEf46kKzN05qPjy0ZIDrRwEIlYCKyws
	OyuAQQNJyprwk+T37GWA1FQrvyc1NC+ZrXvlHzfWSi0GuVabVtwlWGfsDukPcg==
X-Gm-Gg: AYBFou38q31WN/MPJFMH9FMs7c87mjtV3cRAnSBXJcen69ewE7pYICtVxXLzLQCLNOC
	PeYAjAmwLnXJAgOBO34iVS0SFyGjD4yREfHPIzbLBr0ZgNwgSDfpmAm5n4O0uWiS/gCJbMgeKHI
	fsg7e3fTrVZO0Uap0lCKShn3tUvyu2N6JErlzrsF3Ug/50n3goKwGCCn7aP6BHenAi6JXJbC0Xp
	Wi/M/gZB9noMazuSGHvfyy+KHBj4Is73OxRCLwqr2Gq6A8KFpwxSHXHtawsW6jjZLJjPugOckCo
	NzEDU41/iz/sn+7W51+H4L8Cxki77FUAByNGVRxDfb5/NAhPiutQL/o5hgPbPyNJNYbrFyuU1QR
	LZy7znYUJWYe//ozKP/mQtDz/e99LwAjRLe8KC3p8Kvzfw6eo2MxCV/oy4NTqJnmQEpdF08n6oJ
	4VizsTAan3mvvm6ZfvnrZKhXgebLySZouK/eqd8bqCL/pWQ3+JAvAu687b4xrEa9JrOFz9ZWX20
	w564Zd0WyMvEvPE5En/cKF5izhUxvFDuYjmdCXME8ChmKJECW/w56OXlY3yVDZ2A2urJ1jAxicC
	jXOk9fpTH3LX5hZYzezai/eTuyZsDg02RF6aSRhzFg0vp9TiP9QxQY32E6AYkn/z++8SB5yIu8W
	xaPKrmwnw/jhjaCfeS0DYGjeJg2s4iaquXmIUtnSdsTVWkAOzucHseIhLaYSPfoWI
X-Received: by 2002:a05:620a:45a4:b0:945:ad46:5e19 with SMTP id af79cd13be357-949ba9f9eafmr234949485a.38.1795133002061;
        Thu, 19 Nov 2026 16:03:22 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ae74sm74818085a.8.2026.11.19.16.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:03:21 -0800 (PST)
Date: Thu, 19 Nov 2026 19:03:21 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>
Message-ID: <willemdebruijn.kernel.e221ffaa921e@gmail.com>
In-Reply-To: <20261119072258.3157902-5-edumazet@kernel.org>
References: <20261119072258.3157902-1-edumazet@kernel.org>
 <20261119072258.3157902-5-edumazet@kernel.org>
Subject: Re: [PATCH net-next 4/4] tap: remove tap_get_tap_dev() and
 tap_put_tap_dev()
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eric Dumazet wrote:
> tap_get_tap_dev() takes a reference on tap->dev, released by
> tap_put_tap_dev().
> 
> This comes from commit 8f475a318aaa ("macvtap: introduce
> macvtap_get_vlan()"), when q->vlan was read under rcu_read_lock_bh()
> and the reference was needed to use the device after
> rcu_read_unlock_bh().
> 
> Both remaining callers, SIOCGIFHWADDR and SIOCSIFHWADDR, hold RTNL

Iff respinning would be worthwhile to add when the condition that
required the dev_hold went away.

Apparently very soon after the introduction in commit 441ac0fcaadc
("macvtap: Convert to using rtnl lock").

> for the whole time the device is used. tap_del_queues() clears q->tap
> under RTNL, before the device can be freed, so a non NULL q->tap
> guarantees the device stays around until rtnl_unlock(). TUNSETOFFLOAD
> already relies on this.
> 
> Use rtnl_dereference(q->tap) directly.
> 
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>

