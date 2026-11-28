Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860404;
	b=hD2h8c9YyD75dH74mt3pgNlp8LfsnEceQdbT+hp77dkASga6qEzhD8sWn/9ED4xn9ezp
	 r4TW/vr+zbhtPwFZ8jMZBWBNvTJsLJLeCHR4OlP96XT+MELzG9o9EPkoMQN5npL3gScO0
	 SDrJaKT5K+D9wY4gjdrpj4b8lrZZ4lLeonrd63x1tEs9YZsnM887tU+iRyy0Pf09bFtKC
	 CG8mVEvqaB2P8+5cURoVn1X3M0ZQjL/EkQDK3Jju39rmnaGbk7FaA3uL2BI3WCGIsFSva
	 CriQItxI2kvnNS4mgMfSWvQrmEEpp2FzbfDo8YY+7inAdzfQspqP7L8IcgAsa+GVeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860404;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iz6Gu4wn9ZaRJSQkHTUhpD32M0zUUPn/QQt70p/DYZM=;
	b=kyDGWw8vgWuadpZin5ijDJI4fIyRMvYR0wHHGi+KB9CCqRUGxWcyk5OdHn6oBTJY1LCO
	 7l7aPPsUiU8wodcxHJJVn1V8zz/54NR0piUpeb6XV5tDhpuzzfvYNm/BVHt1h8tVYfjpM
	 QRH1bI+lDcDZPsBJ+g6Vg3vkUJTcY0fM+W0mOTRnW7lcCrqkCL0viccEIcB3NAJ9T2G4U
	 IW8+FOYZsumUoYQzHO96KydcMArRSTiOPBB49aFiVrjxudOUlJrPBkz/gLkQ61R7MqAsN
	 pdQa7MRBX7VI6iC0CfStelsrmm/KYNr/0hJJAd0nSxxnJviWopVISd185bIzpClN7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gD0Ehy16;
	arc=none smtp.remote-ip=95.215.58.51
Received: from mta1.migadu.com (out-51.mta1.migadu.com [95.215.58.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E02A606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 10:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E02A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gD0Ehy16
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B1BQI8TVJ5YOFZ9fLb4U/KOixQDi/tIiE4rpBEGQYfs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795860401; v=1; x=1796465201;
 b=gD0Ehy16phiZI6qT9tUU9S1ADrfI/N9jYqTfSZ5tzU7IubuebSx0NBbBfvf7INdD8ACpL8fP
 mif/D+kTLM8YvahW3wR907hXJsV7KSiaU/14oAnRZBoNs05V8JDS/yqwqX0+IT5MD4Yf1G0cMyJ
 lHwJAxlhv6BDYTcq8Eaj8KoI=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f0f0a4959e8da5e8;
	Sat, 28 Nov 2026 10:06:41 +0000
X-Mizu-Trace-ID: f0f0a4959e8da5e8
X-Migadu-Flow: FLOW_OUT
Message-ID: <bf1323d7-cbfd-4826-b3c7-52ad9d9a36c1@linux.dev>
Date: Sat, 28 Nov 2026 10:06:38 +0000
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
Subject: Re: [PATCH net-next v6 6/6] ionic: Add .get_fec_stats ethtool handler
To: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shannon Nelson <sln@onemain.com>
Cc: netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
 "Nikhil P. Rao" <nikhil.rao@amd.com>, Eric Joyner <eric.joyner@amd.com>,
 Breno Leitao <leitao@debian.org>,
 Arun Kumar Prakash <ArunKumar.Prakash@amd.com>
References: <20261125-ionic-get-fec-stats-v6-0-1ab49c729c00@amd.com>
 <20261125-ionic-get-fec-stats-v6-6-1ab49c729c00@amd.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261125-ionic-get-fec-stats-v6-6-1ab49c729c00@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2026 23:22, Brett Creeley wrote:
> From: Eric Joyner <eric.joyner@amd.com>
> 
> Reports FEC statistics totals and an 802.3ck FEC histogram. Per-lane
> counts currently aren't supported. Every counter reported here comes
> from the RS decoder, including fec_corrected_bits_total despite its
> name, and the only histogram format firmware produces is the 16-bin one
> from RS(544,514), so nothing is reported unless RS is the active FEC
> mode. The only devices whose firmware reports the histogram do not
> support RS(528,514), so RS on those devices is always RS(544,514).
> 
> These are physical port counters, so virtual functions are skipped the
> same way ionic_get_link_ext_stats() skips them, rather than reporting the
> port's counters as if they belonged to the VF.
> 
> The reporting of these statistics is gated by DEV_CAP_EXTRA_STATS and
> checks for IONIC_STAT_INVALID, since only the newest devices support
> reporting all of these stats. Older devices can only report some of the
> statistics or not at all, and so the output will properly exclude those
> unsupported statistics.
> 
> The firmware writes these counters by DMA while they are being read.
> Use READ_ONCE() to ensure that the IONIC_STAT_INVALID test and the store
> see the same value. Counters are still read one at a time, so the set
> reported can span more than one firmware update.
> 
> Co-developed-by: Nikhil P. Rao <nikhil.rao@amd.com>
> Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
> Signed-off-by: Eric Joyner <eric.joyner@amd.com>
> Signed-off-by: Brett Creeley <brett.creeley@amd.com>
> ---
>   .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 86 ++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index 3b6c436104d1..ceb029dae0fa 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> @@ -466,6 +466,91 @@ static int ionic_get_fecparam(struct net_device *netdev,
>   	return 0;
>   }
>   
> +#define IONIC_FEC_STAT(dst, src)			\
> +	do {						\
> +		__le64 __val = READ_ONCE(src);		\
> +							\
> +		if (__val != IONIC_STAT_INVALID)	\
> +			(dst) = le64_to_cpu(__val);	\
> +	} while (0)
> +
> +static const struct ethtool_fec_hist_range ionic_fec_hist_ranges[] = {
> +	{ 0, 0},
> +	{ 1, 1},
> +	{ 2, 2},
> +	{ 3, 3},
> +	{ 4, 4},
> +	{ 5, 5},
> +	{ 6, 6},
> +	{ 7, 7},
> +	{ 8, 8},
> +	{ 9, 9},
> +	{ 10, 10},
> +	{ 11, 11},
> +	{ 12, 12},
> +	{ 13, 13},
> +	{ 14, 14},
> +	{ 15, 15},
> +	{ 0, 0},
> +};
> +
> +static void
> +ionic_fill_fec_hist(const struct ionic_port_extra_stats *port_extra_stats,
> +		    struct ethtool_fec_hist *hist)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(port_extra_stats->fec_codeword_error_bin); i++) {
> +		__le64 val = READ_ONCE(port_extra_stats->fec_codeword_error_bin[i]);
> +
> +		if (val == IONIC_STAT_INVALID)
> +			return;
> +
> +		hist->values[i].sum = le64_to_cpu(val);
> +	}
> +
> +	hist->ranges = ionic_fec_hist_ranges;
> +}
> +
> +static void ionic_get_fec_stats(struct net_device *netdev,
> +				struct ethtool_fec_stats *fec_stats,
> +				struct ethtool_fec_hist *hist)
> +{
> +	struct ionic_lif *lif = netdev_priv(netdev);
> +	struct ionic_port_info *port_info;
> +	u8 config_fec_type;
> +
> +	if (lif->ionic->pdev->is_virtfn)
> +		return;
> +
> +	if (test_bit(IONIC_LIF_F_FW_RESET, lif->state))
> +		return;
> +
> +	if (!(lif->ionic->ident.dev.capabilities &
> +	      cpu_to_le64(IONIC_DEV_CAP_EXTRA_STATS)))
> +		return;
> +
> +	port_info = lif->ionic->idev.port_info;
> +	if (!port_info) {
> +		netdev_err_once(netdev, "port_info not initialized\n");
> +		return;
> +	}
> +
> +	config_fec_type = READ_ONCE(port_info->config.fec_type);
> +	if (ionic_active_fec_type(port_info, config_fec_type) !=
> +	    IONIC_PORT_FEC_TYPE_RS)
> +		return;
> +
> +	IONIC_FEC_STAT(fec_stats->corrected_blocks.total,
> +		       port_info->extra_stats.rsfec_correctable_blocks);
> +	IONIC_FEC_STAT(fec_stats->uncorrectable_blocks.total,
> +		       port_info->extra_stats.rsfec_uncorrectable_blocks);
> +	IONIC_FEC_STAT(fec_stats->corrected_bits.total,
> +		       port_info->extra_stats.fec_corrected_bits_total);
> +
> +	ionic_fill_fec_hist(&port_info->extra_stats, hist);
> +}
> +
>   static int ionic_set_fecparam(struct net_device *netdev,
>   			      struct ethtool_fecparam *fec)
>   {
> @@ -1200,6 +1285,7 @@ static const struct ethtool_ops ionic_ethtool_ops = {
>   	.get_module_eeprom_by_page	= ionic_get_module_eeprom_by_page,
>   	.get_pauseparam		= ionic_get_pauseparam,
>   	.set_pauseparam		= ionic_set_pauseparam,
> +	.get_fec_stats		= ionic_get_fec_stats,
>   	.get_fecparam		= ionic_get_fecparam,
>   	.set_fecparam		= ionic_set_fecparam,
>   	.get_ts_info		= ionic_get_ts_info,
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
