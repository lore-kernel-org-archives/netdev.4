Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=49.212.198.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447903;
	b=syt5++uP7wbox4qGVxNVdCMnQhcM53YT1CVQs2QHQuxA5LRLKzURM0q/vPDRkxMfAMDv
	 Wdh8rZgQJ7EB9aJj3TwRBi1xhydtNshV7j/cuBC1pwYa2A0/AXCzXNQYIo16uCdsrFhxg
	 3S5gHB3mouEG7eRzwNRkdyoUNgf9BL4gbzwG3KulMC8ReXXxGv0V2yA+k2e8Pvupr+afm
	 MJHL7vxRv8CNSZP1ekpaBMnb3g7F0Z2mD7+8wlgzAdj0l/3NykCNqNa+iY88KaZwR5X0Q
	 tG4wqkKsygxZjYCsLe14trpqqTdreRECRs4WqFzgbOsvstTRdQgvQWX+IFjuJB2iEYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447903;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=h5rsH2FTHuftKEMiDvVqz9ghi6s0zcdm9kkw+7bVksM=;
	b=H0R5l3AxAanyK/vlTbQry9eA2R1ogKBhO1VytotSzrEkKUVFTfVAjmx7LzxQd0ZskDQx
	 9iK+wRJWM3iHxefTrT7UUikY9U1x8DWbQdfgGOLubcyLzfhF9khrnmgpSYrISRaCQWhOJ
	 dHqxkGnTf8pNLDzppRDcHjoTYosI1IaS9tSn3STqws5ba3qwGa4V82+PAR/gg+WV9EE9+
	 scGB4kPwOkHdj0szxcM1jlqAnBh3moEskgAlsyEZaHZvn9/E4i6qeCkrHloghEWskLFwV
	 0C2o0jp7gXUh1J2MDpTyM9u4/sKwnHVH7VRGSCyF83IuNJU3rqAmKUcehOlBOc2+fBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enjuk.jp;
	spf=pass smtp.mailfrom=enjuk.jp;
	dkim=pass header.d=enjuk.jp header.i=@enjuk.jp header.a=rsa-sha256 header.s=rs20251215 header.b=VDmjpV+W;
	arc=none smtp.remote-ip=49.212.198.91
Received: from www2881.sakura.ne.jp (www2881.sakura.ne.jp [49.212.198.91])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F302606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F302606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enjuk.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enjuk.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=enjuk.jp header.i=@enjuk.jp header.a=rsa-sha256 header.s=rs20251215 header.b=VDmjpV+W
Received: from x1 (KD182250156109.au-net.ne.jp [182.250.156.109])
	(authenticated bits=0)
	by www2881.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 6ANFVTTi018736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2026 00:31:32 +0900 (JST)
	(envelope-from kohei@enjuk.jp)
DKIM-Signature: a=rsa-sha256; bh=h5rsH2FTHuftKEMiDvVqz9ghi6s0zcdm9kkw+7bVksM=;
        c=relaxed/relaxed; d=enjuk.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20251215; t=1795447894; v=1;
        b=VDmjpV+Wi2ROV4p1Ozl56zSJjNp6c83ppoVAc2oK2rP3WPftJGxOexw5gXotop47
         t0dhLqP9zRaEoMHx82uoSSeoGURzJvAJWVENVxrekOHcCHsbFJ30znznD4L/tFJD
         5IQ4rC+t7frsvHbNXriqLDwHLCBwssTJPVhG7DY/x1C7IbDkxPi1SSLJ6k/XlKCG
         dsGYn5MKbn/Qv/797JemE3n43tbSsg8Gbrtb1B85OBQQb74yIrB6RpuVYr6b9UVU
         LHpuNGCncaw4VFMEMbu0m2d6BAMqVcU0eMZkcpblxmnQKH2Hi8ubC1KWp2P6svCt
         9iSLtNHrnRL1jvH4CM7CzA==
Date: Tue, 24 Nov 2026 00:31:29 +0900
From: Kohei Enju <kohei@enjuk.jp>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Kuniyuki Iwashima <kuniyu@google.com>,
        Willem de Bruijn <willemb@google.com>,
        David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>,
        Gerhard Engleder <gerhard@engleder-embedded.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Gomes Vinicius <vinicius.gomes@intel.com>,
        Song Yoong Siang <yoong.siang.song@intel.com>,
        Looi Hong Aun <hong.aun.looi@intel.com>,
        "Tan, Khai Wen" <khai.wen.tan@intel.com>
Subject: Re: [PATCH net v1 0/3] af_packet/tcp: fix late hardware timestamp
 handling
Message-ID: <awRbgl7vlFO-c3Q6@x1>
References: <20260429091632.26509-1-kohei@enjuk.jp>
 <a62bce53-a307-483f-86e9-00949b142e9f@linux.intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a62bce53-a307-483f-86e9-00949b142e9f@linux.intel.com>

On 11/23 16:36, KhaiWenTan wrote:
> On 4/29/2026 5:16 PM, Kohei Enju wrote:
> > Since commit 97dc7cd92ac6 ("ptp: Support late timestamp determination"),
> > skb_shared_hwtstamps may carry netdev_data instead of a resolved
> > hwtstamp. AF_PACKET and TCP could still read that storage as a ktime_t
> > and report bogus hardware timestamps to userspace.
> > 
> > This series factors the late timestamp resolution logic into a common
> > helper, then switches AF_PACKET and TCP to use it.
> > 
> > Notes on SOF_TIMESTAMPING_BIND_PHC:
> > The generic socket receive timestamping path honors it, but the
> > AF_PACKET and TCP receive paths touched here haven't implemented that
> > behavior.
> > This series doesn't change that; those paths always resolve timestamps
> > with cycles == false and preserve their timestamp-domain semantics.
> > 
> > Kohei Enju (3):
> >    net: introduce helper to resolve hardware timestamps from skb
> >    af_packet: use skb_get_hwtstamp() for hardware timestamps
> >    tcp: use skb_get_hwtstamp() for hardware timestamps
> > 
> >   include/linux/skbuff.h | 11 +++++++++++
> >   include/net/tcp.h      |  2 +-
> >   net/core/skbuff.c      | 27 +++++++++++++++++++++++++++
> >   net/ipv4/tcp_input.c   |  3 ++-
> >   net/ipv4/tcp_ipv4.c    |  6 ++++--
> >   net/ipv6/tcp_ipv6.c    |  3 ++-
> >   net/packet/af_packet.c |  2 +-
> >   net/socket.c           | 27 +++------------------------
> >   8 files changed, 51 insertions(+), 30 deletions(-)
> > 
> Hi Kohei,

Hi KhaiWen,
Sorry for the late response.

> 
> I am currently working with Vinicius on a fix for wrong hardware timestamp
> in tcpdump (https://lore.kernel.org/all/20261111053728.2611070-1-khai.wen.tan@linux.intel.com/)
> 
> We have came across your series are also fixing the same issue. I would like
> to check about your current status on the v2 for this series, we are
> planning to implement your fixes (skb_get_hwtstamp() helper) into our patch,
> so we would like to ask if you currently have plan for the series v2. If you
> not having plans for this or don’t have time for this, may we include the
> first patch of this series into our patch, the patch authorship will still
> be kept to you?

I'm not currently working on a v2, so please feel free to incorporate my
changes into your patch. I'm fine with either keeping or dropping my
authorship.

Thanks for taking this forward!

Thanks,
Kohei

> 
> Best Regards,
> KhaiWen
